import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/domain/entities/ponto_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Espero que a entidade nao seja nula', () {
    PontoEntity pontoEntity = PontoEntity(
        motivo: "se comportou durante as aulas a semana inteira",
        pontos: 150,
        tipo: "ganho",
        categoria: "comportamento");

    expect(
        pontoEntity.motivo, "se comportou durante as aulas a semana inteira");
    expect(pontoEntity.pontos, 150);
    expect(pontoEntity.tipo, "ganho");
    expect(pontoEntity.categoria, "comportamento");
  });
}
