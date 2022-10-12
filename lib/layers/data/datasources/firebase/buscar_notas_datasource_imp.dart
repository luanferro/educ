import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:educ/layers/data/datasources/buscar_notas_datasource.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';

class BuscarNotasDataSourceImp implements BuscarNotasDataSource {
  var db = FirebaseFirestore.instance;

  @override
  Future<Either<Exception, List<NotaEntity>>> getNotas(
      String nomeAluno, int bimestre) async {
    try {
      List<NotaEntity> listaNotas = [];

      QuerySnapshot notas = await db
          .collection("alunos")
          .doc(nomeAluno)
          .collection("notas")
          .get();

      listaNotas = [];

      notas.docs.forEach((doc) {
        NotaEntity nota = NotaEntity(
            nota: doc.get("nota"),
            materia: doc.get("materia"),
            bimestre: doc.get("bimestre"));
        listaNotas.add(nota);
      });

      return Right(listaNotas);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
