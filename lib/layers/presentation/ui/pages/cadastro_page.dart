import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/presentation/controllers/aluno_controller.dart';
import 'package:educ/layers/presentation/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:get_it/get_it.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  var controller = GetIt.I.get<AlunoController>();
  AlunoEntity alunoEntity = AlunoEntity();

  var maskFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 5),
                child: IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: (() => Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        )),
                    icon: Icon(Icons.arrow_back_ios_new)),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Padding(padding: EdgeInsets.all(3)),
                Text(
                  "REGISTRE-SE",
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 309,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nome Completo",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.grey[400]),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) => alunoEntity.nome = value),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 45),
                child: Row(
                  children: [
                    Container(
                      width: 173,
                      height: 55,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(35)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                            inputFormatters: [maskFormatter],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Data Nascimento",
                              hintStyle: TextStyle(
                                  fontSize: 17, color: Colors.grey[400]),
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            onChanged: (value) => alunoEntity.dataNascimento =
                                maskFormatter.getMaskedText()),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      width: 121,
                      height: 55,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(35)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Sexo",
                              hintStyle: TextStyle(
                                  fontSize: 17, color: Colors.grey[400]),
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            onChanged: (value) => alunoEntity.sexo = value),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 309,
                height: 55,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Matricula",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.grey[400]),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) =>
                          alunoEntity.matricula = int.tryParse(value)),
                ),
              ),
              Container(
                width: 309,
                height: 55,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Usuario",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.grey[400]),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) => alunoEntity.usuario = value),
                ),
              ),
              Container(
                width: 309,
                height: 55,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Senha",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.grey[400]),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) => alunoEntity.senha = value),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 45),
                child: Row(
                  children: [
                    Container(
                      width: 128,
                      height: 55,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(35)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ano",
                              hintStyle: TextStyle(
                                  fontSize: 17, color: Colors.grey[400]),
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            onChanged: (value) => alunoEntity.ano = value),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      width: 170,
                      height: 55,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(35)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Turma",
                              hintStyle: TextStyle(
                                  fontSize: 17, color: Colors.grey[400]),
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            onChanged: (value) => alunoEntity.turma = value),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 48,
                width: 309,
                margin: const EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                    onPressed: () async => {
                          await controller.cadastrarAluno(alunoEntity),
                          if (controller.retornoUsuario!.isLeft)
                            {
                              if (controller.erro.toString() ==
                                  "Exception: senha fraca")
                                {
                                  exibirAlertDialog(
                                      "Senha fraca. Tente novamente com uma nova senha")
                                }
                              else if (controller.erro.toString() ==
                                  'Exception: email em uso')
                                {
                                  exibirAlertDialog(
                                      "Este usuario já esta em uso")
                                }
                              else
                                {
                                  exibirAlertDialog(
                                      "Erro ao cadastrar aluno! Por favor, tente novamente.")
                                }
                            }
                          else
                            {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              )
                            },
                        },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    child: const Text("REGISTRAR",
                        style: TextStyle(color: Colors.white, fontSize: 17))),
              ),
              Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Já possui uma conta?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                            onPressed: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                )),
                            child: const Text("Entrar",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.deepPurpleAccent,
                                    fontWeight: FontWeight.w500))),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  exibirAlertDialog(String texto) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Erro ao cadastrar usuario"),
              content: Text(texto));
        });
  }
}
