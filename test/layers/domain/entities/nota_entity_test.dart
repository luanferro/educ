import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Espero que a entidade nao seja nula', () {
    NotaEntity notaEntity =
        NotaEntity(nota: 9.5, materia: "matemática", bimestre: 1);

    expect(notaEntity.bimestre, 1);
    expect(notaEntity.materia, "matemática");
    expect(notaEntity.nota, 9.5);
  });
}
