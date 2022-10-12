import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/usecases/buscar_notas/buscar_notas_usecase.dart';

class NotaController {
  final BuscarNotasUseCase _buscarNotasUseCase;

  NotaController(this._buscarNotasUseCase);
  List<NotaEntity> notas = List.empty();

  buscarNotasUseCase(String nomeAluno, int bimestre) {
    return _buscarNotasUseCase.buscarNotas(nomeAluno, bimestre);
  }
}
