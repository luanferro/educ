// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:educ/layers/presentation/controllers/nota_controller.dart';
import 'package:educ/layers/presentation/ui/pages/nota_page.dart';
import 'package:flutter/material.dart';

import 'layers/data/datasources/local/get_notas_datasource_imp.dart';
import 'layers/data/repositories/nota_repository_imp.dart';
import 'layers/domain/usecases/buscar_notas/buscar_notas_usecase_imp.dart';

void main() {
  NotaController controller = NotaController(
      BuscarNotasUseCaseImp(NotaRepositoryImp(GetNotasDataSourceImp())));

  var result = controller.buscarNotasUseCase("Luan Ferro");
  print(result);
}
