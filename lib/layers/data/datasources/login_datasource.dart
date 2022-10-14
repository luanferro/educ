import 'package:either_dart/either.dart';

abstract class LoginDataSource {
  Future<bool> logar(String usuario, String senha);
}
