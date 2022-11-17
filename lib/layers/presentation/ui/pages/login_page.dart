import 'package:educ/layers/presentation/controllers/usuario_controller.dart';
import 'package:educ/layers/presentation/ui/pages/cadastro_page.dart';
import 'package:educ/layers/presentation/ui/pages/home_page.dart';
import 'package:educ/layers/presentation/ui/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controller = GetIt.I.get<UsuarioController>();
  final fieldTextUsuario = TextEditingController();
  final fieldTextSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  "images/logo_educ.png",
                  width: 300,
                  height: 300,
                ),
                const SizedBox(
                  height: 38,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "ENTRAR NO",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans'),
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "EDUC",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                const SizedBox(
                  height: 49,
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
                      controller: fieldTextUsuario,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Login",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.grey[400]),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) => controller.usuario = value,
                    ),
                  ),
                ),
                Container(
                  width: 309,
                  height: 55,
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                        controller: fieldTextSenha,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Senha",
                          hintStyle:
                              TextStyle(fontSize: 17, color: Colors.grey[400]),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        onChanged: (value) => controller.senha = value),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Esqueci minha senha",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 42,
                ),
                Container(
                  height: 48,
                  width: 309,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                      onPressed: () async => {
                            await controller.logarUseCase(
                                controller.usuario ?? '',
                                controller.senha ?? ''),
                            if (controller.isLogado == true)
                              {
                                clearText(),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StartPage()),
                                )
                              }
                            else
                              {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("OK"))
                                          ],
                                          title: Text("Erro ao realizar Login"),
                                          content: Text(
                                              "Usuário ou senha inválido. Por favor, tente novamente!"));
                                    })
                              }
                          },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      child: const Text("ENTRAR",
                          style: TextStyle(color: Colors.white, fontSize: 17))),
                ),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Não possui conta?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                              onPressed: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CadastroPage()),
                                  )),
                              child: const Text("Registre-se",
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
      ),
    );
  }

  void clearText() {
    fieldTextSenha.clear();
    fieldTextUsuario.clear();
  }
}
