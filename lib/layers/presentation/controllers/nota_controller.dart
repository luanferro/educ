import 'package:educ/layers/domain/usecases/buscar_notas/buscar_notas_usecase.dart';

class NotaController {
  final BuscarNotasUseCase _buscarNotasUseCase;

  NotaController(this._buscarNotasUseCase);

  buscarNotasUseCase(String nomeAluno) {
    return _buscarNotasUseCase.buscarNotas(nomeAluno);
  }
}
