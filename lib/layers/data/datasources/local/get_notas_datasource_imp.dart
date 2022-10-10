import 'dart:developer';

import 'package:educ/layers/core/database/database_connection.dart';
import 'package:educ/layers/core/database/database_connection_imp.dart';
import 'package:educ/layers/data/datasources/get_notas_datasource.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:mysql1/mysql1.dart';

class GetNotasDataSourceImp implements GetNotasDataSource {
  DatabaseConnection database;

  GetNotasDataSourceImp({this.database = const DatabaseConnectionImp()});

  @override
  Future<List<NotaEntity>> getNotas(String nomeAluno) async {
    MySqlConnection? conn;
    List<NotaEntity> resultList = List.empty();

    try {
      conn = await database.openConnection();

      var result = await conn
          .query('''select * from tb01_aluno where nome= ?''', [nomeAluno]);

      if (result.isEmpty) {
        throw Exception();
      }
      log('debug: $result');

      return resultList;
    } on MySqlException catch (e, s) {
      log('$e');
      log('$s');
      throw Exception();
    } finally {
      await conn?.close();
    }
  }
}
