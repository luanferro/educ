import 'package:educ/layers/core/database/database_connection.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseConnectionImp implements DatabaseConnection {
  const DatabaseConnectionImp();

  @override
  Future<MySqlConnection> openConnection() async {
    return MySqlConnection.connect(
      ConnectionSettings(
          host: '10.0.2.2',
          port: 3306,
          user: 'root',
          password: 'root12345678',
          db: 'educ_database'),
    );
  }
}
