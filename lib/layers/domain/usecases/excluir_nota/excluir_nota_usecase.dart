import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class ExcluirNotaUseCase {
  Future<bool> excluirNota(NotaEntity notaEntity);
}
