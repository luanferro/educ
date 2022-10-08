import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class NotaRepository {
  Future<bool> inserirNota(NotaEntity notaEntity);

  Future<List<NotaEntity>> getNotas(String nomeALuno);

  Future<bool> removerNota(NotaEntity notaEntity);
}
