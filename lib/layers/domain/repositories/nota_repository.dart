import 'package:either_dart/either.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class NotaRepository {
  Future<Either<Exception, List<NotaEntity>>> buscarNotas(String usuario);
}
