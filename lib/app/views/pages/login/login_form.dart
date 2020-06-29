import 'package:app/app/controllers/auth/auth_controller.dart';
import 'package:app/app/core/consts/routes_consts.dart';
import 'package:app/app/models/pauta.dart';
import 'package:app/app/repositories/pauta_repository.dart';
import 'package:app/app/views/widgets/Button.dart';
import 'package:app/app/views/widgets/custom_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  AuthController _authController;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    //Limpa mensagem de erro
    _authController.message = '';
    super.initState();
  }

  void onSubmit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await _authController.doLoginEmail();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: Form(
        key: _formKey,
        child: Observer(builder: (_) {
          return Column(
            children: <Widget>[
              SizedBox(height: 24),
              CustomTextField(
                autofocus: true,
                hintText: "Email",
                icon: Icons.perm_identity,
                onSaved: _authController.setEmail,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo obrigatório";
                  } else {
                    final bool isValid = EmailValidator.validate(value);
                    return isValid ? null : "Email com o formato inválido";
                  }
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                obscureText: !passwordVisible,
                hintText: "Senha",
                icon: Icons.lock_open,
                onSaved: _authController.setPassword,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: _authController.message.isNotEmpty
                    ? Text(
                        _authController.message,
                        style: TextStyle(
                          color: Colors.deepOrange[400],
                          fontSize: 16,
                        ),
                      )
                    : null,
              ),
              Hero(
                tag: "btnFormSubmit",
                child: Button(
                  text: "Entrar",
                  onPressed: onSubmit,
                  loading: _authController.isLoading,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                      child: Text(
                        'Novo por aqui ? Cadastrar',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      onPressed: () {
                        Future.delayed(Duration.zero, () {
                          Modular.to.pushNamed(RoutesConst.novo_usuario);
                        });
                      }),
                  FlatButton(
                      child: Text(
                        'Esqueceu sua senha ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {
                        Future.delayed(Duration.zero, () {
                          Modular.to.pushNamed(RoutesConst.recuperar_senha);
                        });
                      }),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
