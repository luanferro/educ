import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educ/layers/data/datasources/buscar_aluno_datasource.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BuscarAlunoDataSourceImp implements BuscarAlunoDataSource {
  var db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

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

  @override
  Future<String> carregarImagemPerfil(String imagemName) async {
    try {
      Reference ref = await storage.ref('images/$imagemName');
      String linkImage = await ref.getDownloadURL();

      return linkImage;
    } on FirebaseException catch (e) {
      throw Exception('Erro no download $e');
    }
  }

  Future<List<String>> carregarImagensEventos() async {
    try {
      List<String> arquivos = [];

      String ref1 = await storage.ref('eventos/evento1.jpeg').getDownloadURL();
      String ref2 = await storage.ref('eventos/evento2.jpeg').getDownloadURL();
      String ref3 = await storage.ref('eventos/evento3.jpeg').getDownloadURL();
      // refs = (await storage.ref('eventos/').list()).items;

      // for (var ref in refs) {
      //   arquivos.add(await ref.getDownloadURL());
      // }
      arquivos.add(ref1);
      arquivos.add(ref2);
      arquivos.add(ref3);
      return arquivos;
    } on FirebaseException catch (e) {
      throw Exception('Erro no download $e');
    }
  }
}
