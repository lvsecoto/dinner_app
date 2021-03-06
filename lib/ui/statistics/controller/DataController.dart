import 'dart:async';

import 'package:dinner_app/domain/table/table_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../statistics.dart';

class DataController extends ChangeNotifier {
  final TableRepository tableRepository = TableRepository();
  final StatisticsController statisticsController;
  final tableIndex;

  TableData tableData;

  Timer timer;

  static DataController get(BuildContext context) =>
      Provider.of<DataController>(context, listen: false);

  DataController(this.tableIndex, this.statisticsController) {
    fetch();
  }

  Future<void> fetch() {
    return tableRepository.getTableData(tableIndex).then((tableData) {
      this.tableData = tableData;
      notifyListeners();
      statisticsController.setTableData(tableData);
    });
  }

  Future<void> update(TableData tableData) async {
    await tableRepository.updateTableDate(tableIndex, tableData);
    fetch();
  }

  Future<void> syncAll(TableData tableData) async {
    var forms = await tableRepository.getTableForm();
    var length = forms.length;

    for (int i = 0; i < length; i++) {
      await tableRepository.updateTableDate(i, tableData);
    }

    fetch();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
