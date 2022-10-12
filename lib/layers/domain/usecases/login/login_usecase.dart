import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginUseCase {
  dynamic logar(String usuario, String senha);
}
