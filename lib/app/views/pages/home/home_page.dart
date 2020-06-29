import 'package:app/app/controllers/auth/auth_controller.dart';
import 'package:app/app/core/consts/routes_consts.dart';
import 'package:app/app/views/pages/home/widget/tab/home.tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  AuthController _authController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text(
                "App Pautas",
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Future.delayed(Duration.zero, () {
                  Modular.to.pushNamed(RoutesConst.perfil);
                });
              }),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _authController.doLogout,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Future.delayed(Duration.zero, () {
            Modular.to.pushNamed(RoutesConst.nova_pauta);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: TabsHome(),
      ),
    );
  }
}
