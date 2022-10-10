import 'package:educ/layers/core/database/database_connection.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseConnectionImp implements DatabaseConnection {
  const DatabaseConnectionImp();

  @override
  Future<MySqlConnection> openConnection() async {
    return MySqlConnection.connect(
      ConnectionSettings(
          host: '127.0.0.1',
          port: 3306,
          user: 'root',
          password: '',
          db: 'educ_database'),
    );
  }
}
