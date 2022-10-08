import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/repositories/nota_repository.dart';
import 'package:educ/layers/domain/usecases/excluir_nota/excluir_nota_usecase.dart';

class ExcluirNotaUseCaseImp implements ExcluirNotaUseCase {
  final NotaRepository _notaRepository;

  ExcluirNotaUseCaseImp(this._notaRepository);

  @override
  Future<bool> excluirNota(NotaEntity notaEntity) async {
    return await _notaRepository.removerNota(notaEntity);
  }
}
