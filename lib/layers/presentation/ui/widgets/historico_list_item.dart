import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/entities/ponto_entity.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HistoricoListItem extends StatelessWidget {
  HistoricoListItem({super.key, required this.ponto});

  final PontoEntity ponto;

  var colorRanking = const Color.fromRGBO(0, 0, 0, 0);
  var colorBorder = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {}),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ponto.motivo,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 71, 50, 108),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  children: [
                    Text(
                      (ponto.tipo == "ganho")
                          ? "+${ponto.pontos.toString()}"
                          : "-${ponto.pontos.toString()}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: (ponto.tipo == "ganho")
                              ? Colors.green
                              : Colors.red),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  corRanking(int pontos) {
    if (pontos < 400) {
      colorRanking = Colors.brown;
    } else if (pontos > 400 && pontos < 899) {
      colorRanking = Colors.grey;
    } else if (pontos > 900 && pontos < 1399) {
      colorRanking = const Color.fromRGBO(251, 192, 45, 1);
    } else if (pontos > 1400 && pontos < 1999) {
      colorRanking = const Color.fromRGBO(0, 200, 83, 1);
    } else if (pontos > 2000 && pontos < 2499) {
      colorRanking = const Color.fromRGBO(2, 119, 189, 1);
    } else if (pontos > 2500 && pontos < 2999) {
      colorRanking = const Color.fromRGBO(224, 64, 251, 1);
    } else {
      colorRanking = const Color.fromRGBO(183, 28, 28, 1);
    }
    return colorRanking;
  }

  marginIndex(int index) {
    if (index < 10) {
      return const EdgeInsets.only(left: 3);
    }
  }
}
