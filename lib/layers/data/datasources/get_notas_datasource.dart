import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class GetNotasDataSource {
  Future<List<NotaEntity>> getNotas(String nomeAluno);
}
