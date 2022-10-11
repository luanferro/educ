import 'dart:async';

import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase.dart';

class AlunoController {
  final BuscarAlunoUseCase _buscarAlunoUseCase;

  AlunoController(this._buscarAlunoUseCase) {
    buscarAlunoUseCase("luanferro");
  }

  Future<AlunoEntity>? aluno;

  buscarAlunoUseCase(String usuario) {
    aluno = _buscarAlunoUseCase.buscarAluno(usuario);
  }
}
