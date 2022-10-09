import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class NotaRepository {
  Future<List<NotaEntity>> getNotas(String nomeALuno);
}
