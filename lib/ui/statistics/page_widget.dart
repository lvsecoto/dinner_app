import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'statistics.dart';

class StatisticsPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StatisticsController>(
            create: (_) => StatisticsController()),
        ChangeNotifierProvider<DataController>(
            create: (_) => DataController(StatisticsController.get(_)))
      ],
      child: StatisticsContentWidget(),
    );
  }
}
