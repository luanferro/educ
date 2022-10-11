import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class AlunoRepository {
  Future<AlunoEntity> buscarAluno(String usuario);
}
