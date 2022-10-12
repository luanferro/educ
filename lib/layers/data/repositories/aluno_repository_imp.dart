import 'package:educ/layers/data/datasources/cadastro_aluno_datasource.dart';
import 'package:educ/layers/data/datasources/get_aluno_datasource.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/repositories/aluno_repository.dart';

class AlunoRepositoryImp implements AlunoRepository {
  //final GetAlunoDataSource _getAlunoDataSource;
  final CadastroAlunoDataSource _cadastroAlunoDataSource;

  AlunoRepositoryImp(
      /*this._getAlunoDataSource,*/ this._cadastroAlunoDataSource);

  // @override
  // Future<AlunoEntity> buscarAluno(String usuario) {
  //   Future<AlunoEntity> aluno = _getAlunoDataSource.getAluno(usuario);
  //   return aluno;
  // }

  @override
  void salvarAluno(AlunoEntity alunoEntity) {
    _cadastroAlunoDataSource.cadastrarAluno(alunoEntity);
  }

  @override
  Future<AlunoEntity> buscarAluno(String usuario) {
    // TODO: implement buscarAluno
    throw UnimplementedError();
  }
}
