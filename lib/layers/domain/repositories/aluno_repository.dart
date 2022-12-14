import 'package:either_dart/either.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';

abstract class AlunoRepository {
  Future<Either<Exception, AlunoEntity>> buscarAluno(String usuario);
  void salvarAluno(AlunoEntity alunoEntity);

  Future<Either<Exception, List<AlunoEntity>>> buscarAlunos(
      {required String turma});
  Future<String> buscarImagemPerfil(String imagemName);
}
