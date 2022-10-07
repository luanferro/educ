import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/usecases/get_alunos_por_turma/get_alunos_por_turma_usecase.dart';

class getAlunosPorTurmaUseCaseImp implements GetAlunosPorTurmaUseCase {
  @override
  AlunoEntity call(String turma) {
    if (turma.contains('19BM')) {
      return AlunoEntity(
          nome: "Luan",
          sexo: "masculino",
          dataNascimento: DateTime(1996, 04, 22),
          matricula: 185245866,
          ano: 9,
          turma: "19BM");
    }
    return AlunoEntity(
        nome: "Laisa",
        sexo: "feminino",
        dataNascimento: DateTime(2003, 07, 10),
        matricula: 123234432,
        ano: 9,
        turma: "19AM");
  }
}
