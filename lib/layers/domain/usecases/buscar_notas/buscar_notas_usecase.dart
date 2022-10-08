import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class BuscarNotasUseCase {
  Future<List<NotaEntity>> buscarNotas(String nomeAluno);
}
