import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class GetAlunosPorTurmaUseCase {
  AlunoEntity call(String turma);
}
