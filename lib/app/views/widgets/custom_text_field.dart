import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function onSaved;
  final Function validator;
  final bool autofocus;
  final bool obscureText;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  String hintText = '';
  var icon;
  var suffixIcon;

  CustomTextField({
    @required this.onSaved,
    this.icon,
    this.hintText,
    this.autofocus,
    this.obscureText,
    this.validator,
    this.suffixIcon,
    this.hintStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(fontSize: 20),
        prefixIcon: Icon(
          icon,
          size: 28,
        ),
        suffixIcon: suffixIcon,
      ),
      style: textStyle ??
          TextStyle(
            fontSize: 20,
          ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
