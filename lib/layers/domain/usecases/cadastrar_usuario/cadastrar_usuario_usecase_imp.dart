import 'package:educ/layers/domain/repositories/usuario_repository.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase.dart';
import 'package:either_dart/either.dart';

class CadastrarUsuarioUseCaseImp implements CadastrarUsuarioUseCase {
  final UsuarioRepository _usuarioRepository;

  CadastrarUsuarioUseCaseImp(this._usuarioRepository);

  Future<Either<Exception, bool>>? retorno;

  @override
  Future<Either<Exception, bool>> cadastrarUsuario(
      String usuario, String senha) async {
    retorno = _usuarioRepository.cadastrarUsuario(usuario, senha);
    _usuarioRepository.logar(usuario, senha);
    return retorno!;
  }
}
