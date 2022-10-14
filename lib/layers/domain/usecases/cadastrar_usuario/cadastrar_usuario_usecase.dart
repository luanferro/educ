import 'package:either_dart/either.dart';

abstract class CadastrarUsuarioUseCase {
  Future<Either<Exception, bool>> cadastrarUsuario(
      String usuario, String senha);
}
