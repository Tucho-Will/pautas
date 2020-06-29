import 'package:app/app/core/consts/routes_consts.dart';
import 'package:app/app/interfaces/auth_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    isLoggedUser();
  }

  Future<void> isLoggedUser() async {
    await Future.delayed(Duration(seconds: 1));
    //  Recupera se existe um usuario logado
    IAuthRepositoryInterface repostory =
        Modular.get<IAuthRepositoryInterface>();
    var response = await repostory.getUsuarioLogado();
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutesConst.home);
    } else {
      Modular.to.pushReplacementNamed(RoutesConst.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColorDark),
      ),
    );
  }
}
