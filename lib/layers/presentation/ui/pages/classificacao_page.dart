import 'package:educ/layers/presentation/ui/widgets/classificacao_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/aluno_controller.dart';

class ClassificacaoPage extends StatefulWidget {
  const ClassificacaoPage({super.key});

  @override
  State<ClassificacaoPage> createState() => _ClassificacaoPageState();
}

class _ClassificacaoPageState extends State<ClassificacaoPage> {
  var controller = GetIt.I.get<AlunoController>();
  var colorGeral = const Color.fromRGBO(255, 255, 255, 1);
  var colorTurma = const Color.fromARGB(255, 124, 77, 255);
  var colorTextGeral = Colors.black;
  var colorTextTurma = Colors.white;
  var elo = "";
  var colorRanking = Colors.transparent;

  @override
  void initState() {
    super.initState();

    nomeElo(controller.aluno?.pontos ?? 0);
    _reloadList("");
  }

  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(
        children: [
          Container(
            height: altura / 4,
            color: Colors.deepPurpleAccent,
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_sharp,
                    color: colorRanking,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    elo,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(controller.aluno?.pontos.toString() ?? "0",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: altura * 0.7,
                width: double.infinity,
                color: Colors.transparent,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        )),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        Stack(
                          children: [
                            Container(
                                width: largura * 0.8,
                                height: altura * 0.07,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: largura * 0.36,
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: colorGeral,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                              onPressed: () {
                                                if (colorGeral !=
                                                    const Color.fromRGBO(
                                                        255, 255, 255, 1)) {
                                                  mudarCorBotao();
                                                  _reloadList("");
                                                }
                                              },
                                              child: Text(
                                                "Geral",
                                                style: TextStyle(
                                                    color: colorTextGeral,
                                                    fontSize: 18),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: largura * 0.36,
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: colorTurma,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                              onPressed: () {
                                                if (colorGeral !=
                                                    const Color.fromRGBO(
                                                        124, 77, 255, 1)) {
                                                  mudarCorBotao();
                                                  _reloadList(
                                                      controller.aluno?.turma ??
                                                          "");
                                                }
                                              },
                                              child: Text(
                                                "Turma",
                                                style: TextStyle(
                                                    color: colorTextTurma,
                                                    fontSize: 18),
                                              )),
                                        )
                                      ],
                                    ))),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                              width: largura,
                              color: Colors.white,
                              child: exibirLista(context)),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  exibirLista(BuildContext context) {
    if (controller.alunos.isNotEmpty) {
      return montaLista(controller.alunos, context);
    } else {
      return const Center(
        child: Text("Sem dados"),
      );
    }
  }

  Widget montaLista(List lista, BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, int index) {
          return ClassificacaoListItem(
              aluno: lista[index],
              posicao: lista.indexOf(lista[index]) + 1,
              alunoLogado:
                  controller.aluno!.nome == lista[index].nome ? true : false);
        },
        itemCount: lista.length);
  }

  mudarCorBotao() {
    if (colorGeral == const Color.fromRGBO(255, 255, 255, 1)) {
      colorGeral = const Color.fromRGBO(124, 77, 255, 1);
      colorTextGeral = const Color.fromRGBO(255, 255, 255, 1);
      colorTurma = const Color.fromRGBO(255, 255, 255, 1);
      colorTextTurma = const Color.fromRGBO(0, 0, 0, 1);
    } else {
      colorTurma = const Color.fromRGBO(124, 77, 255, 1);
      colorTextTurma = const Color.fromRGBO(255, 255, 255, 1);
      colorGeral = const Color.fromRGBO(255, 255, 255, 1);
      colorTextGeral = const Color.fromRGBO(0, 0, 0, 1);
    }
    setState(() {});
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

  Future<void> _reloadList(String turma) async {
    // ignore: prefer_typing_uninitialized_variables
    var newList;
    if (turma != "") {
      newList = await Future.delayed(const Duration(seconds: 0),
          () => controller.buscarAlunos(turma: turma));
    } else {
      newList = await Future.delayed(
          const Duration(seconds: 0), () => controller.buscarAlunos(turma: ""));
    }
    setState(() {
      controller.alunos = newList;
    });
  }
}
