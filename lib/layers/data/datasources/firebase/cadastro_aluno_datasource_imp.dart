import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educ/layers/data/datasources/cadastro_aluno_datasource.dart';
import 'package:educ/layers/data/datasources/firebase/script_notas.dart';
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

    //db.collection("alunos").doc(alunoEntity.usuario).set(aluno);
    List<String> materias = [
      "fisica",
      "matemática",
      "português",
      "geografia",
      "historia",
      "biologia",
      "química",
      "filosofia",
      "sociologia",
      "inglês",
      "espanhol",
      "literatura",
      "redação"
    ];
    List<Map<String, dynamic>> notas = ScriptNotas().getNotas(materias);

    for (var nota in notas) {
      db
          .collection("alunos")
          .doc("avaliador")
          .collection("notas")
          .doc()
          .set(nota);
    }
  }
}
