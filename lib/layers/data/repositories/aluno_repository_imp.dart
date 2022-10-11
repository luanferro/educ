import 'package:educ/layers/data/datasources/get_aluno_datasource.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/repositories/aluno_repository.dart';

class AlunoRepositoryImp implements AlunoRepository {
  final GetAlunoDataSource _getAlunoDataSource;

  AlunoRepositoryImp(this._getAlunoDataSource);

  @override
  Future<AlunoEntity> buscarAluno(String usuario) {
    Future<AlunoEntity> aluno = _getAlunoDataSource.getAluno(usuario);
    return aluno;
  }
}
