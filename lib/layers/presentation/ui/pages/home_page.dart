import 'package:educ/layers/data/datasources/firebase/cadastro_aluno_datasource_imp.dart';
import 'package:educ/layers/presentation/ui/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

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
  var elo = "";
  var colorRanking = Colors.transparent;
  XFile? imagem;
  XFile? imagemTemporaria;
  String pathImage = '';
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nomeElo(controller.aluno?.pontos ?? 0);

    if (controller.aluno?.nome == null) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const StartPage()));
      });
    }
    _reloadFotoPerfil();
  }

  @override
  Widget build(BuildContext context) {
    controllerUsuario.buscarUsuarioLogado();
    controller.buscarAlunoUseCase(controllerUsuario.usuario ?? '');
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: altura,
        width: largura,
        child: FutureBuilder(
          future: buscarNome(),
          builder: ((context, snapshot) {
            if (snapshot.hasData && snapshot.data != '') {
              return Stack(
                children: <Widget>[
                  Container(
                    height: altura / 3.5,
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
                      SizedBox(
                        height: altura * 0.2,
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
                            SizedBox(
                              height: altura * 0.03,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 60),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    // ignore: sort_child_properties_last
                                    child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                            radius: 32,
                                            backgroundImage:
                                                (controller.pathImage != null)
                                                    ? NetworkImage(
                                                        controller.pathImage ??
                                                            '') as ImageProvider
                                                    : const AssetImage(
                                                        'images/semfoto.png'))),
                                    style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder()),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      pegarImagemGaleria();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child:
                                                        const Text("Galeria")),
                                                TextButton(
                                                    onPressed: () {
                                                      pegarImagemCamera();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text("Câmera"))
                                              ],
                                              title: const Text(
                                                  textAlign: TextAlign.center,
                                                  "Selecionar Imagem"),
                                            );
                                          });
                                    },
                                  ),
                                  SizedBox(
                                    width: largura * 0.08,
                                  ),
                                  Column(
                                    children: [
                                      Text(controller.aluno?.nome ?? '',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.menu_book_sharp,
                                            color: colorRanking,
                                          ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10)),
                                          Text(elo,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 17),
                        height: altura * 0.2,
                        width: largura * 0.8,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Meus Pontos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  const SizedBox(width: 90),
                                  const Icon(Icons.star),
                                  Text(
                                    controller.aluno?.pontos.toString() ?? "0",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: largura * 0.80,
                                height: 0.5,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 5)),
                                      const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.black12,
                                        backgroundImage:
                                            AssetImage('images/desafios.png'),
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
                                      const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.black12,
                                        backgroundImage:
                                            AssetImage('images/conquistas.png'),
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
                                      const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.black12,
                                        backgroundImage:
                                            AssetImage('images/metas.png'),
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
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Resumo",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                onPressed: (() {}),
                                icon: const Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: largura,
                        height: altura * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15),
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
                                            fontSize: 45,
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
                                            fontSize: 45,
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
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Eventos",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                onPressed: (() {}),
                                icon: const Icon(Icons.arrow_forward_ios))
                          ],
                        ),
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

  nomeElo(int pontos) {
    if (pontos < 400) {
      elo = "Bronze";
      colorRanking = Colors.brown;
    } else if (pontos > 400 && pontos < 899) {
      elo = "Prata";
      colorRanking = Colors.grey;
    } else if (pontos > 900 && pontos < 1399) {
      elo = "Ouro";
      colorRanking = const Color.fromRGBO(251, 192, 45, 1);
    } else if (pontos > 1400 && pontos < 1999) {
      elo = "Platina";
      colorRanking = const Color.fromRGBO(0, 200, 83, 1);
    } else if (pontos > 2000 && pontos < 2499) {
      elo = "Diamante";
      colorRanking = const Color.fromRGBO(2, 119, 189, 1);
    } else if (pontos > 2500 && pontos < 2999) {
      elo = "Mestre";
      colorRanking = const Color.fromRGBO(224, 64, 251, 1);
    } else {
      elo = "Aluno Exemplar";
      colorRanking = const Color.fromRGBO(183, 28, 28, 1);
    }
    setState(() {});
  }

  Future<String> buscarNome() {
    String nome;
    nome = controller.aluno?.nome ?? '';
    var futureNome = Future.value(nome);
    return futureNome;
  }

  void pegarImagemGaleria() async {
    imagemTemporaria = await _picker.pickImage(source: ImageSource.gallery);
    imagem = imagemTemporaria;
    await CadastroAlunoDataSourceImp()
        .salvarImagemPerfil(controller.aluno?.usuario ?? '', imagem!.path);
    _reloadFotoPerfil();
  }

  void pegarImagemCamera() async {
    imagemTemporaria = await _picker.pickImage(source: ImageSource.camera);
    imagem = imagemTemporaria;
    await CadastroAlunoDataSourceImp()
        .salvarImagemPerfil(controller.aluno?.usuario ?? '', imagem!.path);
    _reloadFotoPerfil();
  }

  void _reloadFotoPerfil() async {
    await controller.buscarAlunoUseCase(controller.aluno?.usuario ?? '');
    var newPath = await Future.delayed(
        const Duration(seconds: 0),
        () =>
            controller.buscarImagemStorage(controller.aluno?.fotoPerfil ?? ''));
    setState(() {
      controller.pathImage = newPath;
    });
  }
}
