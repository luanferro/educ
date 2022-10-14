import 'package:either_dart/either.dart';

abstract class CadastroUsuarioDataSource {
  Future<Either<Exception, bool>> cadastrarUsuario(
      String usuario, String senha);
}
