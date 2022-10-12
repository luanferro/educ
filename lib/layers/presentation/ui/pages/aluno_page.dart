import 'package:educ/layers/data/datasources/firebase/cadastro_aluno_datasource_imp.dart';
import 'package:educ/layers/data/datasources/get_aluno_datasource.dart';
import 'package:educ/layers/domain/usecases/cadastrar_aluno/cadastrar_aluno_usecase_imp.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/repositories/aluno_repository_imp.dart';
import '../../../domain/usecases/buscar_aluno/buscar_aluno_usecase_imp.dart';
import '../../controllers/aluno_controller.dart';

class AlunoPage extends StatelessWidget {
  AlunoPage({Key? key}) : super(key: key);

  var controller = GetIt.I.get<AlunoController>();

  @override
  Widget build(BuildContext context) {
    String? nome;
    //controller.aluno!.then((value) => {nome = value.nome});

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Text(nome ?? 'teste aplicativo'),
      ),
    );
  }
}
