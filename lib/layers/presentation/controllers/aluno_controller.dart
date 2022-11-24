import 'package:educ/layers/domain/usecases/buscar_alunos/buscar_alunos_usecase.dart';
import 'package:educ/layers/domain/usecases/buscar_foto_perfil/buscar_foto_perfil_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';
import 'package:either_dart/either.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_aluno/cadastrar_aluno_usecase.dart';

class AlunoController {
  final BuscarAlunoUseCase _buscarAlunoUseCase;
  final BuscarAlunosUseCase _buscarAlunosUseCase;
  final CadastrarAlunoUseCase _cadastrarAlunoUseCase;
  final CadastrarUsuarioUseCase _cadastrarUsuarioUseCase;
  final BuscarFotoPerfilUseCase _buscarFotoPerfilUseCase;

  AlunoController(
      this._buscarAlunoUseCase,
      this._cadastrarAlunoUseCase,
      this._cadastrarUsuarioUseCase,
      this._buscarAlunosUseCase,
      this._buscarFotoPerfilUseCase);

  Either<Exception, AlunoEntity>? retorno;
  Either<Exception, List<AlunoEntity>>? retornoAlunos;
  AlunoEntity? aluno;
  List<AlunoEntity> alunos = [];
  Either<Exception, bool>? retornoUsuario;
  Exception? erro;
  String? pathImage;

  buscarAlunoUseCase(String usuario) async {
    retorno = await _buscarAlunoUseCase.buscarAluno(usuario);
    if (retorno!.isRight) {
      aluno = retorno!.right;
    }
  }

  buscarAlunos({required String turma}) async {
    alunos.clear();
    retornoAlunos = await _buscarAlunosUseCase.buscarAlunos(turma: turma);
    if (retornoAlunos!.isRight) {
      for (var aluno in retornoAlunos!.right) {
        alunos.add(aluno);
      }
      return alunos;
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

  buscarImagemStorage(String nomeImagem) async {
    pathImage = await _buscarFotoPerfilUseCase.buscarImagemPeril(nomeImagem);
    return pathImage;
  }
}
