import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:either_dart/either.dart';

abstract class BuscarAlunoDataSource {
  Future<Either<Exception, AlunoEntity>> buscarAluno(String usuario);
  Future<String> carregarImagemPerfil(String imagemName);
}
