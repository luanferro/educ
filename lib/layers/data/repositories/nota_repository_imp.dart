import 'package:educ/layers/data/datasources/get_notas_datasource.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/repositories/nota_repository.dart';

class NotaRepositoryImp implements NotaRepository {
  final GetNotasDataSource _getNotasDataSource;

  NotaRepositoryImp(this._getNotasDataSource);

  @override
  Future<List<NotaEntity>> getNotas(String nomeALuno) {
    return _getNotasDataSource.getNotas(nomeALuno);
  }
}
