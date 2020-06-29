import 'package:app/app/views/widgets/tab_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'tabs.pauta.dart';

class TabsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = <Widget>[
      Tab(text: "Abertas"),
      Tab(text: "Finalizadas"),
    ];

    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Column(
        children: [
          TabContainer(
            tabs: tabs,
          ),
          Container(
            child: Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  TabsPauta(tabIndex: 0), // abertas
                  TabsPauta(tabIndex: 1), // finalizadas
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
