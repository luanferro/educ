import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/repositories/aluno_repository.dart';
import 'package:educ/layers/domain/usecases/cadastrar_aluno/cadastrar_aluno_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';

class CadastrarAlunoUseCaseImp implements CadastrarAlunoUseCase {
  final AlunoRepository _alunoRepository;
  final CadastrarUsuarioUseCase _cadastrarUsuarioUseCase;
  CadastrarAlunoUseCaseImp(
      this._alunoRepository, this._cadastrarUsuarioUseCase);

  @override
  void cadastrarAluno(AlunoEntity alunoEntity) {
    _alunoRepository.salvarAluno(alunoEntity);
    _cadastrarUsuarioUseCase.cadastrarUsuario(
        alunoEntity.usuario!, alunoEntity.senha!);
  }
}
