import 'package:dartz/dartz.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class BuscarAlunoDataSource {
  Future<Either<Exception, AlunoEntity>> buscarAluno(String usuario);
}
