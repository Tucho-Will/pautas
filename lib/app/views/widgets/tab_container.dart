import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabContainer extends StatelessWidget {
  final List<Widget> tabs;
  final bool isScrollable;

  const TabContainer({Key key, this.tabs, this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: TabBar(
        isScrollable: isScrollable,
        indicatorPadding: EdgeInsets.only(left: 30, right: 30),
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        tabs: tabs,
      ),
    );
  }
}
