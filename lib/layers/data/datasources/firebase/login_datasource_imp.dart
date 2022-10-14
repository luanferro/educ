import 'package:either_dart/either.dart';
import 'package:educ/layers/data/datasources/login_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginDataSourceImp implements LoginDataSource {
  @override
  Future<bool> logar(String usuario, String senha) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: '$usuario@educ.com', password: senha);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }
}
