import 'dart:async';

import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_aluno/cadastrar_aluno_usecase.dart';

class AlunoController {
  final BuscarAlunoUseCase _buscarAlunoUseCase;
  final CadastrarAlunoUseCase _cadastrarAlunoUseCase;

  AlunoController(this._buscarAlunoUseCase, this._cadastrarAlunoUseCase);

  Future<AlunoEntity>? aluno;

  buscarAlunoUseCase(String usuario) {
    aluno = _buscarAlunoUseCase.buscarAluno(usuario);
  }

  cadastrarAluno(AlunoEntity alunoEntity) {
    _cadastrarAlunoUseCase.cadastrarAluno(alunoEntity);
  }
}
