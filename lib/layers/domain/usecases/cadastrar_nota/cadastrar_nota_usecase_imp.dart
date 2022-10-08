import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/repositories/nota_repository.dart';
import 'package:educ/layers/domain/usecases/cadastrar_nota/cadastrar_nota_usecase.dart';

class CadastrarNotaUseCaseImp implements CadastrarNotaUseCase {
  final NotaRepository _notaRepository;

  CadastrarNotaUseCaseImp(this._notaRepository);

  @override
  Future<bool> cadastrarNota(NotaEntity notaEntity) async {
    return await _notaRepository.inserirNota(notaEntity);
  }
}
