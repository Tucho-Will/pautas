import 'package:app/app/controllers/pauta/pauta_controller.dart';
import 'package:app/app/views/pages/home/widget/pauta/card.pauta.widget.dart';
import 'package:app/app/views/widgets/list_view_empty.dart';
import 'package:app/app/views/widgets/list_view_error.dart';
import 'package:app/app/views/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TabsPauta extends StatefulWidget {
  int tabIndex = 0;

  TabsPauta({this.tabIndex});

  @override
  _TabsPautaState createState() => _TabsPautaState();
}

class _TabsPautaState extends State<TabsPauta> {
  PautaController _controller;

  @override
  void initState() {
    _controller = Modular.get();
    super.initState();
  }

  Future _getData() async {
    if (_controller.getPautasByTab(widget.tabIndex).length > 0) {
      return Future.delayed(Duration(milliseconds: 0),
          () => _controller.getPautasByTab(widget.tabIndex));
    }

    return await _controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return FutureBuilder(
          future: _getData(),
          builder: (buildContext, snapshot) {
            Widget child;
            if (snapshot.hasError) {
              child = ListViewError();
            } else if (_controller.isLoading) {
              return Loading();
            } else if (_controller.getPautasByTab(widget.tabIndex).isEmpty) {
              return ListViewEmpty();
            } else {
              child = ListView.builder(
                padding: EdgeInsets.only(bottom: 8),
                itemCount: _controller.getPautasByTab(widget.tabIndex).length,
                itemBuilder: (buildContext, index) => CardPautaWidget(
                    item: _controller.getPautasByTab(widget.tabIndex)[index]),
              );
            }

            return child;
          });
    });
  }
}
