import 'package:educ/layers/presentation/controllers/aluno_controller.dart';
import 'package:educ/layers/presentation/controllers/usuario_controller.dart';
import 'package:educ/layers/presentation/ui/widgets/nota_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/nota_controller.dart';

class NotaPage extends StatefulWidget {
  const NotaPage({super.key});

  @override
  State<NotaPage> createState() => _NotaPageState();
}

class _NotaPageState extends State<NotaPage> {
  var controller = GetIt.I.get<AlunoController>();
  var controllerUsuario = GetIt.I.get<UsuarioController>();
  var controllerNota = GetIt.I.get<NotaController>();
  final tabs = [
    '1B',
    '2B',
    '3B',
    '4B',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 155,
            flexibleSpace: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Notas",
                      style: TextStyle(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Aluno:",
                      style: TextStyle(
                          color: Color.fromARGB(255, 71, 50, 108),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Turma:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 71, 50, 108),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      controller.aluno?.nome ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(controller.aluno?.turma ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              for (final tab in tabs)
                Tab(
                  text: tab,
                )
            ]),
          ),
          body: TabBarView(
            children: [
              exibirLista(1),
              exibirLista(2),
              exibirLista(3),
              exibirLista(4)
            ],
          ),
        ));
  }

  exibirLista(int bimestre) {
    if (bimestre == 1) {
      if (controllerNota.notas1bim.isNotEmpty) {
        return montaLista(controllerNota.notas1bim);
      } else {
        return painelListaVazia();
      }
    } else if (bimestre == 2) {
      if (controllerNota.notas2bim.isNotEmpty) {
        return montaLista(controllerNota.notas2bim);
      } else {
        return painelListaVazia();
      }
    } else if (bimestre == 3) {
      if (controllerNota.notas3bim.isNotEmpty) {
        return montaLista(controllerNota.notas3bim);
      } else {
        return painelListaVazia();
      }
    } else {
      if (controllerNota.notas4bim.isNotEmpty) {
        return montaLista(controllerNota.notas4bim);
      } else {
        return painelListaVazia();
      }
    }
  }

  montaLista(List lista) {
    return ListView(
      shrinkWrap: true,
      children: [
        for (var nota in lista)
          NotaListItem(
            materia: nota.materia,
            nota: nota.nota,
          )
      ],
    );
  }

  painelListaVazia() {
    return Container(
      color: Colors.black12,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Center(
          child: Text(
            "Dados do bimestre não encontrados",
            style: TextStyle(
                color: Color.fromARGB(255, 71, 50, 108),
                fontSize: 25,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
