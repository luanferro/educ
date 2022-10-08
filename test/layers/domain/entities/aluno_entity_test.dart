import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Espero que a entidade nao seja nula', () {
    AlunoEntity alunoEntity = AlunoEntity(
        nome: "Luan",
        sexo: "masculino",
        dataNascimento: DateTime(1996, 04, 22),
        matricula: 1234567,
        ano: 9,
        turma: "19BM");

    expect(alunoEntity.nome, "Luan");
    expect(alunoEntity.sexo, "masculino");
    expect(alunoEntity.dataNascimento, DateTime(1996, 04, 22));
    expect(alunoEntity.matricula, 1234567);
    expect(alunoEntity.ano, 9);
    expect(alunoEntity.turma, "19BM");
  });
}
