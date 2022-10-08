import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/entities/materia_entity.dart';

class NotaEntity {
  double nota;
  MateriaEntity materia;
  AlunoEntity aluno;
  int bimestre;

  NotaEntity({
    required this.nota,
    required this.materia,
    required this.aluno,
    required this.bimestre,
  });
}
