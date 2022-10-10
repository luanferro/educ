import 'dart:developer';

import 'package:educ/layers/core/database/database_connection.dart';
import 'package:educ/layers/core/database/database_connection_imp.dart';
import 'package:educ/layers/data/datasources/get_notas_datasource.dart';
import 'package:educ/layers/data/dtos/aluno_dto.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:mysql1/mysql1.dart';

class GetNotasDataSourceImp implements GetNotasDataSource {
  DatabaseConnection database;
  GetNotasDataSourceImp({this.database = const DatabaseConnectionImp()});

  @override
  Future<List<NotaEntity>> getNotas(String nomeAluno) async {
    MySqlConnection? conn;
    Map map = {};
    AlunoDto alunoDto = AlunoDto(
        nome: 'luan',
        usuario: 'luanferro',
        senha: 'ladasdasd',
        matricula: 31333123,
        turma: '18BM',
        sexo: "masc",
        ano: 9,
        dataNascimento: DateTime(1996, 02, 22));

    try {
      conn = await database.openConnection();

      var result = await conn
          .query('''select * from tb01_aluno where nome= ?''', [nomeAluno]);

      if (result.isEmpty) {
        throw Exception();
      }

      for (var aluno in result) {
        print(aluno.asMap());
        map = aluno.asMap();
      }
      alunoDto = alunoDto.fromMap(map);
      return List<NotaEntity>.empty();
    } on MySqlException catch (e, s) {
      log('$e');
      log('$s');
      throw Exception();
    } finally {
      await conn?.close();
    }
  }
}
