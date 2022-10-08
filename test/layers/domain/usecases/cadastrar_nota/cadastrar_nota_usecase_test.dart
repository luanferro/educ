import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/entities/materia_entity.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/repositories/nota_repository.dart';
import 'package:educ/layers/domain/usecases/cadastrar_nota/cadastrar_nota_usecase.dart';
import 'package:educ/layers/domain/usecases/cadastrar_nota/cadastrar_nota_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

class NotaRepositoryImp implements NotaRepository {
  @override
  Future<bool> inserirNota(NotaEntity notaEntity) async {
    return (notaEntity.bimestre >= 1 && notaEntity.bimestre <= 4);
  }

  @override
  Future<List<NotaEntity>> getNotas(String nomeALuno) {
    // TODO: implement getNotas
    throw UnimplementedError();
  }

  @override
  Future<bool> removerNota(NotaEntity notaEntity) {
    // TODO: implement removerNota
    throw UnimplementedError();
  }
}

main() {
  CadastrarNotaUseCase useCase = CadastrarNotaUseCaseImp(NotaRepositoryImp());

  criarNota() {
    AlunoEntity aluno = AlunoEntity(
        nome: "Luan",
        sexo: "masculino",
        dataNascimento: DateTime(1996, 04, 22),
        matricula: 1234567,
        ano: 9,
        turma: "19BM");

    MateriaEntity materia = MateriaEntity(nome: "matematica");

    var nota =
        NotaEntity(nota: 9.5, materia: materia, aluno: aluno, bimestre: 4);

    return nota;
  }

  test('Espero que salve a nota com sucesso', () async {
    var nota = criarNota();

    var result = await useCase.cadastrarNota(nota);

    expect(result, true);
  });

  test(
      'Espero que nao salve a nota quando o bimestre for menor que 1 ou maior que 4',
      () async {
    var nota = criarNota();
    nota.bimestre = 5;

    var result = await useCase.cadastrarNota(nota);

    expect(result, false);
  });
}
