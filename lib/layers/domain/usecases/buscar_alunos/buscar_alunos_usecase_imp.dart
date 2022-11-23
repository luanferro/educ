import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase_imp.dart';
import 'package:educ/layers/domain/usecases/buscar_alunos/buscar_alunos_usecase.dart';
import 'package:either_dart/src/either.dart';

import '../../repositories/aluno_repository.dart';

class BuscarAlunosUseCaseImp implements BuscarAlunosUseCase {
  final AlunoRepository _alunoRepository;

  BuscarAlunosUseCaseImp(this._alunoRepository);

  @override
  Future<Either<Exception, List<AlunoEntity>>> buscarAlunos(
      {required String turma}) async {
    return await _alunoRepository.buscarAlunos(turma: turma);
  }
}
