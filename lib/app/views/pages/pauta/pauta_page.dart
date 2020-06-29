import 'package:app/app/controllers/pauta/pauta_controller.dart';
import 'package:app/app/views/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PautaPage extends StatefulWidget {
  PautaPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PautaPageState();
}

class _PautaPageState extends State<PautaPage> {
  PautaController _pautaController;

  @override
  void initState() {
    _pautaController = Modular.get<PautaController>();
    initControler();
    super.initState();
  }

  Future<void> initControler() async {
    _pautaController.clearData();
    await _pautaController.getUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController txAutor = TextEditingController();

    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          centerTitle: false,
          title: Text("Nova Pauta"),
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Digite o título',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: _pautaController.setTitulo,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Breve descrição',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: _pautaController.setDescricao,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Detalhes',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: _pautaController.setDetalhe,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4),
                child: Observer(builder: (_) {
                  txAutor.text = _pautaController.user != null
                      ? _pautaController.user.nome
                      : '';
                  return TextField(
                    controller: txAutor,
                    enabled: false,
                  );
                }),
              ),
            ],
          ),
        ),
        bottomSheet: BottomAppBar(
          child: Observer(builder: (_) {
            return _pautaController.enableButton
                ? getButton(_pautaController.salvarPauta)
                : Opacity(
                    opacity: 0.5,
                    child: getButton(null),
                  );
          }),
        ));
  }

  Widget getButton(void callBack()) {
    return Button(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      text: "Finalizar",
      onPressed: callBack,
      loading: _pautaController.isLoading,
    );
  }
}
