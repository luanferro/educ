import 'package:educ/layers/data/datasources/cadastro_usuario_datasource.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroUsuarioDataSourceImp implements CadastroUsuarioDataSource {
  @override
  Future<Either<Exception, bool>> cadastrarUsuario(
      String usuario, String senha) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '$usuario@educ.com',
        password: senha,
      );
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Exception('senha fraca'));
      } else if (e.code == 'email-already-in-use') {
        return Left(Exception('email em uso'));
      }
      return Left(Exception('Erro inesperado! Tente novamente mais tarde'));
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
