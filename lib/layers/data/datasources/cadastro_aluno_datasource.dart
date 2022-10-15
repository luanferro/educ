import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class CadastroAlunoDataSource {
  void cadastrarAluno(AlunoEntity alunoEntity);
}
