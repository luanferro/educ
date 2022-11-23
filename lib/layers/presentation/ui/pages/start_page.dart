import 'package:educ/layers/presentation/ui/pages/classificacao_page.dart';
import 'package:educ/layers/presentation/ui/pages/home_page.dart';
import 'package:educ/layers/presentation/ui/pages/perfil_page.dart';
import 'package:educ/layers/presentation/ui/pages/ranking_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/aluno_controller.dart';
import '../../controllers/nota_controller.dart';
import '../../controllers/usuario_controller.dart';
import 'nota_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var controller = GetIt.I.get<AlunoController>();
  var controllerUsuario = GetIt.I.get<UsuarioController>();
  var controllerNota = GetIt.I.get<NotaController>();
  final pageViewController = PageController(initialPage: 2);

  @override
  void initState() {
    controllerNota.buscarNotasUseCase(controllerUsuario.usuario ?? '');
    controller.buscarAlunos(turma: "");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        allowImplicitScrolling: true,
        controller: pageViewController,
        children: const [
          PerfilPage(),
          RankingPage(),
          HomePage(),
          ClassificacaoPage(),
          NotaPage()
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: pageViewController.page?.round() ?? 2,
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepPurpleAccent,
              items: const [
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
            );
          }),
    );
  }
}
