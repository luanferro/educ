import 'package:educ/layers/domain/usecases/buscar_usuario/buscar_usuario_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';
import 'package:educ/layers/domain/usecases/login/login_usecase.dart';

class UsuarioController {
  final CadastrarUsuarioUseCase _cadastrarUsuarioUseCase;
  final LoginUseCase _loginUseCase;
  final BuscarUsuarioUseCase _buscarUsuarioUseCase;

  String? usuario;
  String? senha;
  bool? isLogado;

  UsuarioController(this._cadastrarUsuarioUseCase, this._loginUseCase,
      this._buscarUsuarioUseCase);

  cadastrarUsuarioUseCase(String usuario, String senha) {
    _cadastrarUsuarioUseCase.cadastrarUsuario(usuario, senha);
  }

  logarUseCase(String usuario, String senha) async {
    isLogado = null;
    isLogado = await _loginUseCase.logar(usuario, senha);
  }

  buscarUsuarioLogado() {
    usuario = _buscarUsuarioUseCase.buscarUsuarioLogado();
  }
}
