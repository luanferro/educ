abstract class UsuarioRepository {
  Future<dynamic> cadastrarUsuario(String usuario, String senha);
  Future<dynamic> logar(String usuario, String senha);
}
