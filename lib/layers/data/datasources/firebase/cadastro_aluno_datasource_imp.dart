import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educ/layers/data/datasources/cadastro_aluno_datasource.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';

class CadastroAlunoDataSourceImp implements CadastroAlunoDataSource {
  var db = FirebaseFirestore.instance;

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
      "senha": alunoEntity.senha
    };

    db.collection("alunos").doc(alunoEntity.usuario).set(aluno);
  }
}
