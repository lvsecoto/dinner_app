import 'package:dinner_app/ui/statistics/controller/table_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'statistics.dart';

class StatisticsPageWidget extends StatelessWidget {
  final tableIndex;

  const StatisticsPageWidget({Key key, int tableIndex})
      : this.tableIndex = tableIndex ?? 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StatisticsController>(
            create: (_) => StatisticsController()),
        ChangeNotifierProvider<TableAllController>(
            create: (_) => TableAllController()),
        ChangeNotifierProvider<DataController>(
            create: (_) =>
                DataController(tableIndex, StatisticsController.get(_))),
      ],
      child: StatisticsContentWidget(),
    );
  }
}
