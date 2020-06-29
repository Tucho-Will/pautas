import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardWidget extends StatelessWidget {
  final EdgeInsets paddingBetweenCard;
  final EdgeInsets paddingInternalCard;
  Widget child;
  Widget detail;

  CardWidget(
      {@required this.child,
      this.detail,
      this.paddingBetweenCard,
      this.paddingInternalCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingBetweenCard != null
          ? paddingBetweenCard
          : EdgeInsets.only(top: 16),
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ),
          child: ExpansionTile(
            title: Padding(
              padding: EdgeInsets.only(top: 16, right: 12, bottom: 16),
              child: child,
            ),
            children: [detail],
          )),
    );
  }
}
