import 'package:dinner_app/domain/table/table_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('', () async {
    final repository = TableRepository();

    final tableData = await repository.getTableData();
    var tableData2 = TableData();
    tableData2.qiaoSchedule = true;
    tableData2.yuanAmount = 3.0;
    await repository.updateTableDate(tableData2);
  });
}
