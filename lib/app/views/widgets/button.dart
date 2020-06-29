import 'package:flutter/material.dart';

import 'Loading.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool loading;
  final Color color;
  final BorderRadiusGeometry borderRadius;
  final double height;

  Button(
      {this.text,
      this.onPressed,
      this.loading = false,
      this.color,
      this.borderRadius,
      this.height = 56});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: borderRadius ??
            BorderRadius.only(
              topRight: Radius.circular(6),
              topLeft: Radius.circular(6),
            ),
      ),
      child: loading ? Loading() : flatButton(text, onPressed),
    );
  }
}

Widget flatButton(text, onPressed) {
  return FlatButton(
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    onPressed: onPressed,
  );
}
