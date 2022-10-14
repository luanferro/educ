import 'package:either_dart/either.dart';

abstract class UsuarioRepository {
  Future<Either<Exception, bool>> cadastrarUsuario(
      String usuario, String senha);
  Future<bool> logar(String usuario, String senha);
  String buscarUsuarioLogado();
}
