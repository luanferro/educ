import 'package:educ/layers/presentation/ui/tools/custom_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../controllers/aluno_controller.dart';
import '../../controllers/usuario_controller.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  var controller = GetIt.I.get<AlunoController>();
  var controllerUsuario = GetIt.I.get<UsuarioController>();
  var elo = "";
  var colorRanking = Colors.transparent;
  var corElo = Colors.transparent;
  double percentual = 0;
  List<String> elos = [
    "Bronze",
    "Prata",
    "Ouro",
    "Platina",
    "Diamante",
    "Mestre",
    "Aluno exemplar"
  ];

  List<num> pontosElos = [
    400,
    900,
    1400,
    2000,
    2500,
    3000,
  ];

  @override
  void initState() {
    super.initState();

    nomeElo(controller.aluno?.pontos ?? 0);
    controller.buscarPontos(controllerUsuario.usuario ?? '');
  }

  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Stack(children: <Widget>[
          Container(
            height: altura / 1.5,
            width: largura,
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ranking Atual",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: colorRanking),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        boxShadow: [
                          CustomBoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              blurRadius: 10.0,
                              blurStyle: BlurStyle.outer)
                        ]),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 150,
                          lineWidth: 5,
                          percent: percentual,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            children: [
                              const SizedBox(
                                height: 35,
                              ),
                              Icon(
                                Icons.menu_book_sharp,
                                color: colorRanking,
                                size: 180,
                              ),
                              Text(
                                controller.aluno?.pontos.toString() ?? '',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: colorRanking),
                              ),
                            ],
                          ),
                          animationDuration: 1200,
                          progressColor: colorRanking,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    elo,
                    style: TextStyle(
                        color: colorRanking,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    (elo != "Aluno Exemplar")
                        ? "+ ${(pontosElos[elos.indexOf(elo)] - (controller.aluno?.pontos ?? 0))} para ${elos[(elos.indexOf(elo) + 1)]}"
                        : "",
                    style: TextStyle(
                        color: colorRanking,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 190,
                margin: EdgeInsets.only(bottom: 15),
                child: exibirLista(context),
              ),
            ],
          )
        ]));
  }

  nomeElo(int pontos) {
    if (pontos < 400) {
      elo = "Bronze";
      colorRanking = Colors.brown;
      percentual = 50;
      percentual = ((pontos * 100) / 400) / 100;
    } else if (pontos > 400 && pontos < 899) {
      elo = "Prata";
      colorRanking = Colors.grey;
      percentual = ((pontos * 100) / 900) / 100;
    } else if (pontos > 900 && pontos < 1399) {
      elo = "Ouro";
      colorRanking = const Color.fromRGBO(251, 192, 45, 1);
      percentual = ((pontos * 100) / 1400) / 100;
    } else if (pontos > 1400 && pontos < 1999) {
      elo = "Platina";
      colorRanking = const Color.fromRGBO(0, 200, 83, 1);
      percentual = ((pontos * 100) / 2000) / 100;
    } else if (pontos > 2000 && pontos < 2499) {
      elo = "Diamante";
      colorRanking = const Color.fromRGBO(2, 119, 189, 1);
      percentual = ((pontos * 100) / 2500) / 100;
    } else if (pontos > 2500 && pontos < 2999) {
      elo = "Mestre";
      colorRanking = const Color.fromRGBO(224, 64, 251, 1);
      percentual = ((pontos * 100) / 3000) / 100;
    } else {
      elo = "Aluno Exemplar";
      colorRanking = const Color.fromRGBO(183, 28, 28, 1);
      percentual = 1;
    }
    setState(() {});
  }

  defineCorElo(String elo) {
    if (elo == "Bronze") {
      corElo = Colors.brown;
    } else if (elo == "Prata") {
      corElo = Colors.grey;
    } else if (elo == "Ouro") {
      corElo = const Color.fromRGBO(251, 192, 45, 1);
    } else if (elo == "Platina") {
      corElo = const Color.fromRGBO(0, 200, 83, 1);
    } else if (elo == "Diamante") {
      corElo = const Color.fromRGBO(2, 119, 189, 1);
    } else if (elo == "Mestre") {
      corElo = const Color.fromRGBO(224, 64, 251, 1);
    } else {
      corElo = const Color.fromRGBO(183, 28, 28, 1);
    }
    return corElo;
  }

  exibirLista(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              width: 150,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    color:
                        (elos[index] == elo) ? Colors.cyan[200] : Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: const Offset(3, 5))
                    ]),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.menu_book_sharp,
                          color: defineCorElo(elos[index]),
                          size: 70,
                        ),
                        Text(
                          elos[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, color: defineCorElo(elos[index])),
                        ),
                      ],
                    )),
              ),
            ),
          );
        },
        itemCount: elos.length);
  }
}
