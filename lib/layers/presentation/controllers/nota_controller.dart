import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/usecases/buscar_notas/buscar_notas_usecase.dart';

class NotaController {
  final BuscarNotasUseCase _buscarNotasUseCase;

  NotaController(this._buscarNotasUseCase);

  Future<List<NotaEntity>> notas;

  buscarNotasUseCase(String nomeAluno) {
    notas = _buscarNotasUseCase.buscarNotas(nomeAluno);
  }
}
