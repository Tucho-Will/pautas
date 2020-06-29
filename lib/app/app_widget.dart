import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';

import 'core/consts/routes_consts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pautas',
      initialRoute: RoutesConst.inicial,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    ));
  }
}
