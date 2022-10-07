class AlunoEntity {
  String nome;
  String sexo;
  DateTime dataNascimento;
  int matricula;
  int ano;
  String turma;

  AlunoEntity(
      {required this.nome,
      required this.sexo,
      required this.dataNascimento,
      required this.matricula,
      required this.ano,
      required this.turma});
}
