import 'package:educ/layers/data/datasources/local/get_notas_datasource_imp.dart';
import 'package:educ/layers/data/repositories/nota_repository_imp.dart';
import 'package:educ/layers/domain/repositories/nota_repository.dart';
import 'package:flutter_test/flutter_test.dart';

maain() {
  NotaRepository repository = NotaRepositoryImp(GetNotasDataSourceImp());

  test('Devolva uma nota', () {
    String nomeAluno = "Luan";

    var result = repository.getNotas(nomeAluno);

    expect(result, isNotNull);
  });
}
