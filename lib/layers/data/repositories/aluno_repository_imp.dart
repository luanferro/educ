import 'package:educ/layers/data/datasources/buscar_alunos_datasource.dart';
import 'package:either_dart/either.dart';
import 'package:educ/layers/data/datasources/cadastro_aluno_datasource.dart';
import 'package:educ/layers/data/datasources/buscar_aluno_datasource.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/repositories/aluno_repository.dart';

class AlunoRepositoryImp implements AlunoRepository {
  final BuscarAlunoDataSource _getAlunoDataSource;
  final CadastroAlunoDataSource _cadastroAlunoDataSource;
  final BuscarAlunosDataSource _buscarAlunosDataSource;

  AlunoRepositoryImp(this._getAlunoDataSource, this._cadastroAlunoDataSource,
      this._buscarAlunosDataSource);

  @override
  Future<Either<Exception, AlunoEntity>> buscarAluno(String usuario) {
    return _getAlunoDataSource.buscarAluno(usuario);
  }

  @override
  void salvarAluno(AlunoEntity alunoEntity) {
    _cadastroAlunoDataSource.cadastrarAluno(alunoEntity);
  }

  @override
  Future<Either<Exception, List<AlunoEntity>>> buscarAlunos(
      {required String turma}) {
    return _buscarAlunosDataSource.buscarAlunos(turma: turma);
  }
}
