// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educ/core/inject/inject.dart';
import 'package:educ/layers/data/datasources/firebase/cadastro_datasource_imp.dart';
import 'package:educ/layers/data/datasources/firebase/login_datasource_imp.dart';
import 'package:educ/layers/data/repositories/usuario_repository_imp.dart';
import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/repositories/usuario_repository.dart';
import 'package:educ/layers/domain/usecases/cadastrar_usuario/cadastrar_usuario_usecase_imp.dart';
import 'package:educ/layers/domain/usecases/login/login_usecase_imp.dart';
import 'package:educ/layers/presentation/controllers/usuario_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'layers/presentation/controllers/aluno_controller.dart';
import 'layers/presentation/ui/pages/nota_page.dart';

void main() async {
  Inject.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  var controller = GetIt.I.get<AlunoController>();
  controller.cadastrarAluno(AlunoEntity(
      nome: 'luan ferro',
      sexo: 'masculino',
      matricula: 12345678,
      dataNascimento: '22-04-1996',
      ano: '9',
      turma: '19BM',
      usuario: 'luanferro',
      senha: 'luan2204'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Educ Gaming School',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const NotaPage(),
    );
  }
}
