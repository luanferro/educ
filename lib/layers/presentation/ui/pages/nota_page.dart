import 'package:educ/layers/domain/entities/nota_entity.dart';
import 'package:educ/layers/presentation/controllers/aluno_controller.dart';
import 'package:educ/layers/presentation/controllers/usuario_controller.dart';
import 'package:educ/layers/presentation/ui/pages/home_page.dart';
import 'package:educ/layers/presentation/ui/widgets/nota_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/nota_controller.dart';

class NotaPage extends StatefulWidget {
  const NotaPage({super.key});

  @override
  State<NotaPage> createState() => _NotaPageState();
}

class _NotaPageState extends State<NotaPage> {
  int _selectedIndex = 0;
  var controller = GetIt.I.get<AlunoController>();
  var controllerUsuario = GetIt.I.get<UsuarioController>();
  var controllerNota = GetIt.I.get<NotaController>();
  final tabs = [
    '1B',
    '2B',
    '3B',
    '4B',
  ];

  void _onItemTapped(int index) {
    setState(() {
      controllerUsuario.buscarUsuarioLogado();
      controller.buscarAlunoUseCase(controllerUsuario.usuario ?? '');
      controllerNota.buscarNotasUseCase(controllerUsuario.usuario ?? '');
      _selectedIndex = index;
      if (index == 2) {
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 155,
              flexibleSpace: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100),
                      IconButton(
                          onPressed: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          }),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 110,
                      ),
                      const Text(
                        "Notas",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
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
                Container(
                  color: Colors.black12,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var nota in controllerNota.notas1bim)
                        NotaListItem(
                          materia: nota.materia,
                          nota: nota.nota,
                        )
                    ],
                  ),
                ),
                Container(
                  color: Colors.black12,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var nota in controllerNota.notas2bim)
                        NotaListItem(
                          materia: nota.materia,
                          nota: nota.nota,
                        )
                    ],
                  ),
                ),
                Container(
                  color: Colors.black12,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var nota in controllerNota.notas3bim)
                        NotaListItem(
                          materia: nota.materia,
                          nota: nota.nota,
                        )
                    ],
                  ),
                ),
                Container(
                  color: Colors.black12,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var nota in controllerNota.notas4bim)
                        NotaListItem(
                          materia: nota.materia,
                          nota: nota.nota,
                        )
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.deepPurpleAccent,
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'perfil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.workspace_premium),
                  label: 'ranking',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard),
                  label: 'classificação',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'notas',
                ),
              ],
            )));
  }
}
