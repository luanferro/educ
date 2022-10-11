import 'package:educ/layers/data/datasources/firebase/get_aluno_datasource_imp.dart';
import 'package:educ/layers/data/repositories/aluno_repository_imp.dart';
import 'package:educ/layers/domain/usecases/buscar_aluno/buscar_aluno_usecase_imp.dart';
import 'package:educ/layers/presentation/controllers/aluno_controller.dart';
import 'package:flutter/material.dart';

class AlunoPage extends StatelessWidget {
  AlunoPage({Key? key}) : super(key: key);

  // AlunoController controller = AlunoController(
  //     BuscarAlunoUseCaseImp(AlunoRepositoryImp(GetAlunoDataSourceImp())));

  @override
  Widget build(BuildContext context) {
    String? nome;
    controller.aluno!.then((value) => {nome = value.nome});

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Text(nome ?? 'teste aplicativo'),
      ),
    );
  }
}
