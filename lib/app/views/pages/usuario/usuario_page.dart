import 'package:app/app/views/pages/usuario/usuario_form.dart';
import 'package:app/app/views/widgets/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsuarioPage extends StatefulWidget {
  UsuarioPage({Key key}) : super(key: key);

  @protected
  @override
  State<StatefulWidget> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(left: 24, right: 24),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: LogoWidget(),
                  ),
                  Text(
                    "Novo Usuario",
                    style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            UsuarioForm(),
          ],
        ),
      ),
    );
  }
}
