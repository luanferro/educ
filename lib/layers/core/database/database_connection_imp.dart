import 'package:educ/layers/core/database/database_connection.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseConnectionImp implements DatabaseConnection {
  static String host = '10.0.2.2',
      user = 'root',
      password = 'root12345678',
      db = 'educ_database';
  static int port = 3306;

  const DatabaseConnectionImp();

  @override
  Future<MySqlConnection> openConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
