import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educ/layers/data/datasources/cadastro_aluno_datasource.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CadastroAlunoDataSourceImp implements CadastroAlunoDataSource {
  var db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  @override
  void cadastrarAluno(AlunoEntity alunoEntity) {
    final aluno = <String, dynamic>{
      "nome": alunoEntity.nome,
      "sexo": alunoEntity.sexo,
      "data_nascimento": alunoEntity.dataNascimento,
      "matricula": alunoEntity.matricula,
      "ano": alunoEntity.ano,
      "turma": alunoEntity.turma,
      "usuario": alunoEntity.usuario,
      "senha": alunoEntity.senha,
      "pontos": 0
    };

    db.collection("alunos").doc(alunoEntity.usuario).set(aluno);
  }

  Future<void> salvarImagemPerfil(String usuario, String path) async {
    File file = File(path);
    try {
      String ref = 'images/img-${DateTime.now().toString()}.jpg';
      TaskSnapshot task = await storage.ref(ref).putFile(file);

      db
          .collection("alunos")
          .doc(usuario)
          .update({'fotoPerfil': task.ref.name});
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload $e');
    }
  }
}
