import 'package:educ/layers/domain/repositories/usuario_repository.dart';

import '../datasources/cadastro_usuario_datasource.dart';
import '../datasources/login_datasource.dart';

class UsuarioRepositoryImp implements UsuarioRepository {
  final CadastroUsuarioDataSource _cadastroDataSource;
  final LoginDataSource _loginDataSource;

  UsuarioRepositoryImp(this._cadastroDataSource, this._loginDataSource);

  @override
  Future cadastrarUsuario(String usuario, String senha) {
    return _cadastroDataSource.cadastrarUsuario(usuario, senha);
  }

  @override
  Future logar(String usuario, String senha) {
    return _loginDataSource.logar(usuario, senha);
  }
}
