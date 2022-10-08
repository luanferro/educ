import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/usecases/buscar_notas/buscar_notas_usecase.dart';

import '../../repositories/nota_repository.dart';

class BuscarNotasUseCaseImp implements BuscarNotasUseCase {
  final NotaRepository _notaRepository;

  BuscarNotasUseCaseImp(this._notaRepository);

  @override
  Future<List<NotaEntity>> buscarNotas(String nomeAluno) async {
    return await _notaRepository.getNotas(nomeAluno);
  }
}
