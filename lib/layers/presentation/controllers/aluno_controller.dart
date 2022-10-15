import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';
import 'package:either_dart/either.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_aluno/cadastrar_aluno_usecase.dart';

class AlunoController {
  final BuscarAlunoUseCase _buscarAlunoUseCase;
  final CadastrarAlunoUseCase _cadastrarAlunoUseCase;
  final CadastrarUsuarioUseCase _cadastrarUsuarioUseCase;

  AlunoController(this._buscarAlunoUseCase, this._cadastrarAlunoUseCase,
      this._cadastrarUsuarioUseCase);

  Either<Exception, AlunoEntity>? retorno;
  AlunoEntity? aluno;
  Either<Exception, bool>? retornoUsuario;
  Exception? erro;

  buscarAlunoUseCase(String usuario) async {
    retorno = await _buscarAlunoUseCase.buscarAluno(usuario);
    if (retorno!.isRight) {
      aluno = retorno!.right;
    }
  }

  cadastrarAluno(AlunoEntity alunoEntity) async {
    retornoUsuario = await _cadastrarUsuarioUseCase.cadastrarUsuario(
        alunoEntity.usuario!, alunoEntity.senha!);

    if (retornoUsuario!.isRight) {
      _cadastrarAlunoUseCase.cadastrarAluno(alunoEntity);
    } else {
      erro = retornoUsuario!.left;
    }
  }
}
