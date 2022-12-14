import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Espero que a entidade nao seja nula', () {
    AlunoEntity alunoEntity = AlunoEntity(
        nome: "Luan",
        sexo: "masculino",
        dataNascimento: "22-04-1996",
        matricula: 1234567,
        ano: "9",
        turma: "19BM",
        usuario: "luanferro",
        senha: "luan2204",
        fotoPerfil: "linkfoto",
        pontos: 2000);

    expect(alunoEntity.nome, "Luan");
    expect(alunoEntity.sexo, "masculino");
    expect(alunoEntity.dataNascimento, "22-04-1996");
    expect(alunoEntity.matricula, 1234567);
    expect(alunoEntity.ano, "9");
    expect(alunoEntity.turma, "19BM");
    expect(alunoEntity.fotoPerfil, "linkfoto");
    expect(alunoEntity.pontos, 2000);
  });
}
