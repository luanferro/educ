import 'package:either_dart/either.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class BuscarAlunoUseCase {
  Future<Either<Exception, AlunoEntity>> buscarAluno(String usuario);
}
