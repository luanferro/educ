import 'package:educ/layers/presentation/ui/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/aluno_controller.dart';
import '../../controllers/usuario_controller.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = GetIt.I.get<AlunoController>();
  var controllerUsuario = GetIt.I.get<UsuarioController>();

  @override
  void initState() {
    super.initState();

    if (controller.aluno?.nome == null) {
      Future.delayed(const Duration(seconds: 2)).then((value) =>
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const StartPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    controllerUsuario.buscarUsuarioLogado();
    controller.buscarAlunoUseCase(controllerUsuario.usuario ?? '');
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: buscarNome(),
          builder: ((context, snapshot) {
            if (snapshot.hasData && snapshot.data != '') {
              return Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          )),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: (() {}),
                                    icon: const Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: ((() async {
                                      controllerUsuario.deslogarUsuario();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()),
                                      );
                                    })),
                                    icon: const Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    )),
                                const Padding(
                                    padding: EdgeInsets.only(left: 10))
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 30)),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.transparent,
                                      width: 97,
                                      height: 97,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                    ),
                                    const CircleAvatar(
                                      radius: 47,
                                      backgroundImage:
                                          AssetImage('images/foto_perfil.jpg'),
                                    ),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 60)),
                                Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(top: 25)),
                                    Text(controller.aluno?.nome ?? '',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.menu_book_sharp,
                                          color: Colors.blue,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Text('Diamante II',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(bottom: 40))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 11),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.83,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 57)),
                                  Text('Meus Pontos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  Padding(padding: EdgeInsets.only(left: 110)),
                                  Icon(Icons.star),
                                  Text(
                                    '1323',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                              Container(
                                width: 325,
                                height: 0.5,
                                color: Colors.black,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 7)),
                                      Stack(
                                        children: const <Widget>[
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.black12,
                                            backgroundImage: AssetImage(
                                                'images/desafios.png'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Desafios",
                                        style: TextStyle(
                                            color: Colors.grey.shade500),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 7)),
                                      Stack(
                                        children: const <Widget>[
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.black12,
                                            backgroundImage: AssetImage(
                                                'images/conquistas.png'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Conquistas",
                                        style: TextStyle(
                                            color: Colors.grey.shade500),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 7)),
                                      Stack(
                                        children: const <Widget>[
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.black12,
                                            backgroundImage:
                                                AssetImage('images/metas.png'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Metas",
                                        style: TextStyle(
                                            color: Colors.grey.shade500),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: const Text(
                              "Resumo",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 260),
                            child: IconButton(
                                onPressed: (() {}),
                                icon: const Icon(Icons.arrow_forward_ios)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              width: 170,
                              height: 230,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3))
                                    ],
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      "Pontos Perdidos",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("- 37",
                                        style: TextStyle(
                                            color: Colors.redAccent[700],
                                            fontSize: 55,
                                            fontWeight: FontWeight.w500)),
                                    const Text("nos ultimos 30 dias",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500)),
                                    Container(
                                      color: Colors.white,
                                      width: 150,
                                      height: 2,
                                    ),
                                    const Text("+ Detalhes",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 170,
                              height: 230,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3))
                                    ],
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      "Pontos Ganhos",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("+ 180",
                                        style: TextStyle(
                                            color: Colors.greenAccent[700],
                                            fontSize: 55,
                                            fontWeight: FontWeight.w500)),
                                    const Text("nos ultimos 30 dias",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500)),
                                    Container(
                                      color: Colors.white,
                                      width: 150,
                                      height: 2,
                                    ),
                                    const Text("+ Detalhes",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: const Text(
                              "Eventos",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 260),
                            child: IconButton(
                                onPressed: (() {}),
                                icon: const Icon(Icons.arrow_forward_ios)),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              );
            } else {
              return const Center(
                child: SpinKitCircle(
                  color: Colors.deepPurpleAccent,
                  size: 50,
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  Future<String> buscarNome() {
    String nome;
    nome = controller.aluno?.nome ?? '';
    var futureNome = Future.value(nome);
    return futureNome;
  }
}
