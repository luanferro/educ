import 'package:either_dart/either.dart';
import 'package:educ/layers/data/datasources/buscar_usuario_datasource.dart';
import 'package:educ/layers/domain/repositories/usuario_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../datasources/cadastro_usuario_datasource.dart';
import '../datasources/login_datasource.dart';

class UsuarioRepositoryImp implements UsuarioRepository {
  final CadastroUsuarioDataSource _cadastroDataSource;
  final LoginDataSource _loginDataSource;
  final BuscarUsuarioDataSource _buscarUsuarioDataSource;

  UsuarioRepositoryImp(this._cadastroDataSource, this._loginDataSource,
      this._buscarUsuarioDataSource);

  @override
  Future<Either<Exception, bool>> cadastrarUsuario(
      String usuario, String senha) {
    return _cadastroDataSource.cadastrarUsuario(usuario, senha);
  }

  @override
  Future<Either<Exception, UserCredential>> logar(
      String usuario, String senha) {
    return _loginDataSource.logar(usuario, senha);
  }

  @override
  String buscarUsuarioLogado() {
    return _buscarUsuarioDataSource.buscarUsuarioLogado();
  }
}
