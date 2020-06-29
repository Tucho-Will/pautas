import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_modules.dart';
import 'app/core/local_storage/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Inicia a instancia do banco de dados
  await DatabaseHelper.initDB();

  runApp(
    ModularApp(
      module: AppModule(),
    ),
  );
}
