import 'package:dinner_app/ui/statistics/controller/controller.dart';
import 'package:flutter/material.dart';

import 'table.dart';

/// 表格
class TableWidget extends StatelessWidget {
  const TableWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableDataWidget(
            title: "袁",
            changedAmount: (it) =>
                StatisticsController.get(context).setYuanRiceAmount(it),
            changedScheduler: (it) =>
                StatisticsController.get(context).setYuanSchedule(it),
          ),
          TableDataWidget(
            title: "乔",
            changedAmount: (it) =>
                StatisticsController.get(context).setQiaoRiceAmount(it),
            changedScheduler: (it) =>
                StatisticsController.get(context).setQiaoSchedule(it),
          ),
          TableDataWidget(
            title: "妈",
            changedAmount: (it) =>
                StatisticsController.get(context).setMaRiceAmount(it),
          ),
          TableDataWidget(
            title: "爸",
            changedAmount: (it) =>
                StatisticsController.get(context).setBaRiceAmount(it),
            changedScheduler: (it) =>
                StatisticsController.get(context).setBaSchedule(it),
          ),
        ],
      ),
    );
  }
}
