import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/entities/materia_entity.dart';
import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Espero que a entidade nao seja nula', () {
    AlunoEntity aluno = AlunoEntity(
        nome: "Luan",
        sexo: "masculino",
        dataNascimento: DateTime(1996, 04, 22),
        matricula: 1234567,
        ano: 9,
        turma: "19BM");

    MateriaEntity materia = MateriaEntity(nome: "matematica");

    NotaEntity notaEntity =
        NotaEntity(nota: 9.5, materia: materia, aluno: aluno, bimestre: 1);

    expect(notaEntity.aluno, aluno);
    expect(notaEntity.bimestre, 1);
    expect(notaEntity.materia, materia);
    expect(notaEntity.nota, 9.5);
  });
}
