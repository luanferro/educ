import 'package:educ/layers/domain/entities/nota_entity.dart';

abstract class CadastrarNotaUseCase {
  Future<bool> cadastrarNota(NotaEntity notaEntity);
}
