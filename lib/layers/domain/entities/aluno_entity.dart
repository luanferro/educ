class AlunoEntity {
  String nome;
  String sexo;
  DateTime dataNascimento;
  int matricula;
  int ano;
  String turma;
  String usuario;
  String senha;

  AlunoEntity(
      {required this.nome,
      required this.sexo,
      required this.dataNascimento,
      required this.matricula,
      required this.ano,
      required this.turma,
      required this.usuario,
      required this.senha});
}
