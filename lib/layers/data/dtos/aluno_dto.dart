// ignore_for_file: annotate_overrides, overridden_fields

import 'package:educ/layers/domain/entities/aluno_entity.dart';

class AlunoDto extends AlunoEntity {
  String nome;
  String usuario;
  String senha;
  int matricula;
  String turma;
  String sexo;
  int ano;
  DateTime dataNascimento;

  AlunoDto(
      {required this.nome,
      required this.usuario,
      required this.senha,
      required this.matricula,
      required this.turma,
      required this.sexo,
      required this.ano,
      required this.dataNascimento})
      : super(
            nome: nome,
            usuario: usuario,
            senha: senha,
            matricula: matricula,
            turma: turma,
            sexo: sexo,
            ano: ano,
            dataNascimento: dataNascimento);

  Map toMap() {
    return {
      'nome': nome,
      'usuario': usuario,
      'senha': senha,
      'matricula': matricula,
      'turma': turma,
      'sexo': sexo,
      'ano': ano,
      'data_nascimento': dataNascimento
    };
  }

  AlunoDto fromMap(Map map) {
    return AlunoDto(
        nome: map['nome'],
        usuario: map['usuario'],
        senha: map['senha'],
        matricula: map['matricula'],
        turma: map['turma'],
        sexo: map['sexo'],
        ano: map['ano'],
        dataNascimento: map['data_nascimento']);
  }
}
