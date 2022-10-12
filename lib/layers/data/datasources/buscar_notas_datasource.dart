import 'package:dartz/dartz.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class BuscarNotasDataSource {
  Future<Either<Exception, List<NotaEntity>>> getNotas(
      String nomeAluno, int bimestre);
}
