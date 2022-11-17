import 'package:either_dart/either.dart';
import 'package:educ/layers/data/datasources/login_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginDataSourceImp implements LoginDataSource {
  @override
  Future<Either<Exception, UserCredential>> logar(
      String usuario, String senha) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: '$usuario@educ.com', password: senha);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
      return Left(Exception(e));
    }
  }
}
