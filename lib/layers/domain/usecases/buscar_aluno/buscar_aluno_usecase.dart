import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class BuscarAlunoUseCase {
  Future<AlunoEntity> buscarAluno(String usuario);
}
