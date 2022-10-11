import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/repositories/aluno_repository.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase.dart';

class BuscarAlunoUseCaseImp implements BuscarAlunoUseCase {
  final AlunoRepository _alunoRepository;

  BuscarAlunoUseCaseImp(this._alunoRepository);

  @override
  Future<AlunoEntity> buscarAluno(String usuario) {
    return _alunoRepository.buscarAluno(usuario);
  }
}
