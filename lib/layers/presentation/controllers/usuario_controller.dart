import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';
import 'package:educ/layers/domain/usecases/login/login_usecase.dart';

class UsuarioController {
  final CadastrarUsuarioUseCase _cadastrarUsuarioUseCase;
  final LoginUseCase _loginUseCase;

  UsuarioController(this._cadastrarUsuarioUseCase, this._loginUseCase);

  cadastrarUsuarioUseCase(String usuario, String senha) {
    _cadastrarUsuarioUseCase.cadastrarUsuario(usuario, senha);
  }

  logarUseCase(String usuario, String senha) {
    _loginUseCase.logar(usuario, senha);
  }
}
