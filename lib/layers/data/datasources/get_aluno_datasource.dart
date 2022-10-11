import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class GetAlunoDataSource {
  Future<AlunoEntity> getAluno(String usuario);
}
