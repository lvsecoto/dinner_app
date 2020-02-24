import 'package:dinner_app/domain/table/table_repository.dart';
import 'package:dinner_app/ui/statistics/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Consumer<DataController>(
            builder: (_, controller, __) {
              print(controller.tableData?.yuanAmount);
              return TableDataWidget(
                amount: controller.tableData?.yuanAmount,
                schedule: controller.tableData?.yuanSchedule,
                title: "袁",
                changedAmount: (it) {
                  StatisticsController.get(context).setYuanRiceAmount(it);
                  DataController.get(context).update(TableData(yuanAmount: it));
                },
                changedScheduler: (it) {
                  StatisticsController.get(context).setYuanSchedule(it);
                  DataController.get(context)
                      .update(TableData(yuanSchedule: it));
                },
              );
            },
          ),
          Consumer<DataController>(
            builder: (_, controller, __) =>
                TableDataWidget(
                  amount: controller.tableData?.qiaoAmount,
                  schedule: controller.tableData?.qiaoSchedule,
                  title: "乔",
                  changedAmount: (it) {
                    StatisticsController.get(context).setQiaoRiceAmount(it);
                    DataController.get(context).update(
                        TableData(qiaoAmount: it));
                  },
                  changedScheduler: (it) {
                    StatisticsController.get(context).setQiaoSchedule(it);
                    DataController.get(context).update(
                        TableData(qiaoSchedule: it));
                  },
                ),
          ),
          Consumer<DataController>(
            builder: (_, controller, __) =>
                TableDataWidget(
                  amount: controller.tableData?.maAmount,
                  title: "妈",
                  changedAmount: (it) {
                    StatisticsController.get(context).setMaRiceAmount(it);
                    DataController.get(context).update(TableData(maAmount: it));
                  },
                ),
          ),
          Consumer<DataController>(
            builder: (_, controller, __) =>
                TableDataWidget(
                  amount: controller.tableData?.baAmount,
                  schedule: controller.tableData?.baSchedule,
                  title: "爸",
                  changedAmount: (it) {
                    StatisticsController.get(context).setBaRiceAmount(it);
                    DataController.get(context).update(TableData(baAmount: it));
                  },
                  changedScheduler: (it) {
                    StatisticsController.get(context).setBaSchedule(it);
                    DataController.get(context).update(
                        TableData(baSchedule: it));
                  },
                ),
          ),
        ],
      ),
    );
  }
}
