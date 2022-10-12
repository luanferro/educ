import 'package:educ/layers/data/datasources/cadastro_usuario_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroUsuarioDataSourceImp implements CadastroUsuarioDataSource {
  @override
  Future cadastrarUsuario(String usuario, String senha) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '$usuario@educ.com',
        password: senha,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
