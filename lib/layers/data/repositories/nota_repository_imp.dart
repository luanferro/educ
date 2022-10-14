import 'package:either_dart/either.dart';
import 'package:educ/layers/data/datasources/buscar_notas_datasource.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/repositories/nota_repository.dart';

class NotaRepositoryImp implements NotaRepository {
  final BuscarNotasDataSource _getNotasDataSource;

  NotaRepositoryImp(this._getNotasDataSource);

  @override
  Future<Either<Exception, List<NotaEntity>>> buscarNotas(String usuario) {
    return _getNotasDataSource.getNotas(usuario);
  }
}
