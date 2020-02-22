import 'package:dinner_app/ui/statistics/statistics.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class StatisticsContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("饭量统计")),
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
