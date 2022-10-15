import 'package:educ/layers/domain/usecases/buscar_usuario/buscar_usuario_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';
import 'package:educ/layers/domain/usecases/login/login_usecase.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsuarioController {
  final CadastrarUsuarioUseCase _cadastrarUsuarioUseCase;
  final LoginUseCase _loginUseCase;
  final BuscarUsuarioUseCase _buscarUsuarioUseCase;

  String? usuario;
  String? senha;
  Either<Exception, UserCredential>? retorno;
  bool? isLogado;

  UsuarioController(this._cadastrarUsuarioUseCase, this._loginUseCase,
      this._buscarUsuarioUseCase);

  cadastrarUsuarioUseCase(String usuario, String senha) {
    _cadastrarUsuarioUseCase.cadastrarUsuario(usuario, senha);
  }

  logarUseCase(String usuario, String senha) async {
    retorno = await _loginUseCase.logar(usuario, senha);
    if (retorno!.isRight && retorno?.right != null) {
      isLogado = true;
    } else {
      isLogado = false;
    }
  }

  buscarUsuarioLogado() {
    usuario = _buscarUsuarioUseCase.buscarUsuarioLogado();
  }

  deslogarUsuario() {
    usuario = "";
    senha = "";
    FirebaseAuth.instance.signOut();
  }
}
