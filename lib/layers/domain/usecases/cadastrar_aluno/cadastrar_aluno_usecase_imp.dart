import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/repositories/aluno_repository.dart';
import 'package:educ/layers/domain/usecases/cadastrar_aluno/cadastrar_aluno_usecase.dart';

class CadastrarAlunoUseCaseImp implements CadastrarAlunoUseCase {
  final AlunoRepository _alunoRepository;

  CadastrarAlunoUseCaseImp(this._alunoRepository);

  @override
  void cadastrarAluno(AlunoEntity alunoEntity) {
    _alunoRepository.salvarAluno(alunoEntity);
  }
}
