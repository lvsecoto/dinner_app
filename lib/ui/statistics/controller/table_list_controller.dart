import 'package:dinner_app/domain/table/table_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedController extends ChangeNotifier {
  int selectedTableList = 0;

  void select(int index) {
    selectedTableList = index;
    notifyListeners();
  }
}

class TableAllController extends ChangeNotifier {
  TableRepository tableRepository = TableRepository();

  List<TableForm> tables;

  TableAllController() {
    fetch();
  }

  Future<void> fetch() {
    return tableRepository.getTableForm().then((value) {
      tables = value;
      notifyListeners();
    });
  }

  Future<int> addTable() async {
    await tableRepository.add();
    await fetch();
    return tables.length - 1;
  }

}
