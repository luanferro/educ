import 'package:educ/layers/domain/repositories/usuario_repository.dart';
import 'package:educ/layers/domain/usecases/buscar_usuario/buscar_usuario_usecase.dart';

class BuscarUsuarioUseCaseImp implements BuscarUsuarioUseCase {
  final UsuarioRepository _usuarioRepository;

  BuscarUsuarioUseCaseImp(this._usuarioRepository);
  @override
  String buscarUsuarioLogado() {
    return _usuarioRepository.buscarUsuarioLogado();
  }
}
