import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educ/layers/data/datasources/buscar_aluno_datasource.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:either_dart/either.dart';

class BuscarAlunoDataSourceImp implements BuscarAlunoDataSource {
  var db = FirebaseFirestore.instance;

  @override
  Future<Either<Exception, AlunoEntity>> buscarAluno(String usuario) async {
    try {
      final ref = db.collection("alunos").doc(usuario).withConverter(
            fromFirestore: AlunoEntity.fromFirestore,
            toFirestore: (AlunoEntity alunoEntity, _) =>
                alunoEntity.toFirestore(),
          );
      final docSnap = await ref.get();
      final aluno = docSnap.data();
      if (aluno != null) {
        return Right(aluno);
      } else {
        // ignore: avoid_print
        print("No such document.");
        return Left(Exception('Nenhum aluno encontrado'));
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
