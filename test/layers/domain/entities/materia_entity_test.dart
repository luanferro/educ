import 'package:educ/layers/domain/entities/materia_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Espero que a entidade nao seja nula', () {
    MateriaEntity materiaEntity = MateriaEntity(nome: "matematica");

    expect(materiaEntity.nome, "matematica");
  });
}
