import 'package:educ/layers/domain/repositories/usuario_repository.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';

class CadastrarUsuarioUseCaseImp implements CadastrarUsuarioUseCase {
  final UsuarioRepository _usuarioRepository;

  CadastrarUsuarioUseCaseImp(this._usuarioRepository);

  @override
  Future<dynamic> cadastrarUsuario(String usuario, String senha) async {
    _usuarioRepository.cadastrarUsuario(usuario, senha);
    _usuarioRepository.logar(usuario, senha);
  }
}
