import 'package:app/app/controllers/pauta/pauta_controller.dart';
import 'package:app/app/models/pauta.dart';
import 'package:app/app/views/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../card/card.widget.dart';

class CardPautaWidget extends StatefulWidget {
  final Pauta item;

  CardPautaWidget({@required this.item});

  @override
  _CardPautaWidgetState createState() => _CardPautaWidgetState();
}

class _CardPautaWidgetState extends State<CardPautaWidget> {
  PautaController _controller;

  @override
  void initState() {
    _controller = Modular.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.assignment,
            size: 36,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.item.titulo.toString().toUpperCase(),
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
              SizedBox(height: 4),
              Text(
                widget.item.descricao,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
      detail: _getDetail(),
    );
  }

  Widget _getDetail() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.detalhe,
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Autor : " + widget.item.autor.nome,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Button(
              text: widget.item.status == 0 ? "Finalizar" : "Reabrir",
              height: 48,
              onPressed: () => _controller.alterarStatus(widget.item),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            )
          ],
        ));
  }
}
