import 'package:flutter/cupertino.dart' as list_view_empty;
import 'package:flutter/material.dart';

class ListViewEmpty extends list_view_empty.StatelessWidget {
  @override
  list_view_empty.Widget build(list_view_empty.BuildContext context) {
    return list_view_empty.ListView(
      padding: list_view_empty.EdgeInsets.only(top: 180),
      children: <list_view_empty.Widget>[
        list_view_empty.Center(
          child: list_view_empty.Column(
            mainAxisAlignment: list_view_empty.MainAxisAlignment.center,
            children: <list_view_empty.Widget>[
              list_view_empty.Icon(
                Icons.search,
                size: 50,
                color: Colors.black54,
              ),
              list_view_empty.Padding(
                padding: list_view_empty.EdgeInsets.only(bottom: 8),
              ),
              list_view_empty.Text(
                "Nenhum registro encontrado.",
                style: list_view_empty.TextStyle(
                    fontSize: 16, fontWeight: list_view_empty.FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
