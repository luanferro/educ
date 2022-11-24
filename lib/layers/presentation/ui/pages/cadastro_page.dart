import 'package:adaptive_components/adaptive_components.dart';
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

  var maskFormatterTurma = RegExp(r'[1-2]{1}[1-9]{1}[a-z]{1}(m|v)');
  final formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Masculino';
  var items = ['Masculino', 'Feminino', 'Outro'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AdaptiveContainer(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 5),
                    child: IconButton(
                        alignment: Alignment.topLeft,
                        onPressed: (() => Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            )),
                        icon: const Icon(Icons.arrow_back_ios_new)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Padding(padding: EdgeInsets.all(3)),
                                  Text(
                                    "REGISTRE-SE",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.deepPurpleAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo inválido';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Nome Completo",
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[400]),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        onChanged: (value) =>
                                            alunoEntity.nome = value),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      margin: const EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Campo inválido';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              maskFormatter,
                                            ],
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Data Nascimento",
                                              hintStyle: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey[400]),
                                              labelStyle: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onChanged: (value) => alunoEntity
                                                    .dataNascimento =
                                                maskFormatter.getMaskedText()),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.36,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      margin: const EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 10),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              value: dropdownvalue,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(items));
                                              }).toList(),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  dropdownvalue = value!;
                                                });
                                                alunoEntity.sexo =
                                                    dropdownvalue;
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo inválido';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        maxLength: 9,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          border: InputBorder.none,
                                          hintText: "Matricula",
                                          alignLabelWithHint: true,
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[400]),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        onChanged: (value) => alunoEntity
                                            .matricula = int.tryParse(value)),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo inválido';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Usuario",
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[400]),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        onChanged: (value) =>
                                            alunoEntity.usuario = value),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Campo inválido';
                                          }
                                          return null;
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Senha",
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[400]),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        onChanged: (value) =>
                                            alunoEntity.senha = value),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      margin: const EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Campo inválido';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Ano",
                                              hintStyle: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey[400]),
                                              labelStyle: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onChanged: (value) =>
                                                alunoEntity.ano = value),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.46,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      margin: const EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty ||
                                                  maskFormatterTurma
                                                      .hasMatch(value)) {
                                                return 'Campo inválido';
                                              }
                                              return null;
                                            },
                                            maxLength: 4,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              border: InputBorder.none,
                                              hintText: "Turma",
                                              hintStyle: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey[400]),
                                              labelStyle: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onChanged: (value) => alunoEntity
                                                .turma = value.toLowerCase()),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 48,
                              width: 309,
                              margin: const EdgeInsets.only(bottom: 15),
                              child: ElevatedButton(
                                  onPressed: () async => {
                                        if (!formKey.currentState!.validate())
                                          {
                                            await Future.delayed(
                                                const Duration(seconds: 2)),
                                            formKey.currentState?.reset(),
                                          },
                                        await controller
                                            .cadastrarAluno(alunoEntity),
                                        if (controller.retornoUsuario!.isLeft)
                                          {
                                            if (controller.erro.toString() ==
                                                "Exception: senha fraca")
                                              {
                                                exibirAlertDialog(
                                                    "Senha fraca. Tente novamente com uma nova senha")
                                              }
                                            else if (controller.erro
                                                    .toString() ==
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
                                                  builder: (context) =>
                                                      const LoginPage()),
                                            )
                                          },
                                      },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                  ),
                                  child: const Text("REGISTRAR",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17))),
                            ),
                            Column(
                              children: [
                                Row(
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
                                                  builder: (context) =>
                                                      const LoginPage()),
                                            )),
                                        child: const Text("Entrar",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.deepPurpleAccent,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  validaTurma() {}

  exibirAlertDialog(String texto) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"))
              ],
              title: const Text("Erro ao cadastrar usuario"),
              content: Text(texto));
        });
  }
}
