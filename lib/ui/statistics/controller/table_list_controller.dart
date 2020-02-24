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

  void fetch() {
    tableRepository.getTableForm().then((value) {
      tables = value;
      notifyListeners();
    });
  }

  void addTable() {}
}
