import 'package:dartz/dartz.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class NotaRepository {
  Future<Either<Exception, List<NotaEntity>>> getNotas(
      String nomeALuno, int bimestre);
}
