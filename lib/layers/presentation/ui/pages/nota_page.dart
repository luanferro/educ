import 'package:educ/layers/data/datasources/local/get_notas_datasource_imp.dart';
import 'package:educ/layers/data/repositories/nota_repository_imp.dart';
import 'package:educ/layers/domain/usecases/buscar_notas/buscar_notas_usecase_imp.dart';
import 'package:educ/layers/presentation/controllers/nota_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotaPage extends StatelessWidget {
  NotaPage({Key? key}) : super(key: key);

  NotaController controller = NotaController(
      BuscarNotasUseCaseImp(NotaRepositoryImp(GetNotasDataSourceImp())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(24),
      child: Text('teste'),
    ));
  }
}
