import 'package:flutter/material.dart';

class ListViewError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 180),
      children: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error,
                size: 50,
                color: Colors.red,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
              ),
              Text(
                "Não foi possivel carregar as informações, tente novamente.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
