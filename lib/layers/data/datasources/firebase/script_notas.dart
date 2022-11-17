import 'dart:math';

class ScriptNotas {
  List<Map<String, dynamic>> notas = [];

  void criarObjetoNotas(List<String> materias) {
    loopMapNotas(materias, 1);
    loopMapNotas(materias, 2);
    loopMapNotas(materias, 3);
    loopMapNotas(materias, 4);
  }

  loopMapNotas(List<String> materias, int bimestre) {
    for (var materia in materias) {
      Map<String, dynamic> nota = {
        "bimestre": bimestre,
        "materia": materia,
        "nota": Random().nextInt(10)
      };
      notas.add(nota);
    }
  }

  List<Map<String, dynamic>> getNotas(List<String> materias) {
    criarObjetoNotas(materias);
    return notas;
  }
}

      // "nota": nota,
      // "materia": materia,
      // "bimestre": bimestre,