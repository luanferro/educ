import 'package:either_dart/either.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class BuscarAlunosUseCase {
  Future<Either<Exception, List<AlunoEntity>>> buscarAlunos(
      {required String turma});
}
