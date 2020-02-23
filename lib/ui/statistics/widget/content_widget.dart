import 'package:dinner_app/ui/statistics/statistics.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class StatisticsContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("饭量统计")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("表格一览",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: theme.primaryColor,
              ),
            ),
            ListTile(
              title: Text("abcd"),
            ),
            ListTile(
              title: Text("abcd"),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: TableWidget(),
            ),
          ),
          SummaryWidget(),
        ],
      ),
    );
  }
}
