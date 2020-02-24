import 'dart:convert';

import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_repository.g.dart';

var dio = Dio(BaseOptions(headers: {
  "X-Bmob-Application-Id": "f9765bfd208045bac43e8335b87565de",
  "X-Bmob-REST-API-Key": "3c6ee7ea18d5bb205e01d3740aea9a51",
  "Content-Type": "application/json",
}, baseUrl: "https://api2.bmob.cn/1"))
  ..interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    error: true,
  ));

class TableRepository {
  Future<TableData> getTableData(int tableIndex) async {
    final respone = await dio.get("/classes/table_data/LuF1000H",
        queryParameters: {"where": "\"arrayKey\":2"});
    var data = respone.data["kv"][tableIndex];
    print(data);
    return TableData.fromJson(data);
  }

  Future<void> updateTableDate(int tableIndex, TableData tableData) async {
    var kvList = tableData
        .toJson()
        .entries
        .map((it) => {
      "kv.$tableIndex.${it.key}": it.value,
            })
        .toList();

    for (var it in kvList) {
      await dio.put("/classes/table_data/LuF1000H", data: jsonEncode(it));
    }
  }

  Future<List<TableForm>> getTableForm() async {
    final response = await dio.get("/classes/table_data/LuF1000H");
    List data = response.data["kv"];

    return data
        .mapIndexedNotNull((index, e) => TableForm(index: index))
        .toList();
  }

  Future<void> add() async {
    return dio.put("/classes/table_data/LuF1000H",
        data: jsonEncode({
          "kv": {
            "__op": "Add",
            "objects": [
              {"name": "表1"}
            ]
          }
        }));
  }

  Future<void> delete(int index) async {
    final respone = await dio.get("/classes/table_data/LuF1000H",
        queryParameters: {"where": "\"arrayKey\":2"});
    var data = respone.data["kv"][index];

    return dio.put("/classes/table_data/LuF1000H",
        data: jsonEncode({
          "kv": {
            "__op": "Remove",
            "objects": [
              data,
            ]
          }
        }));
  }
}

@JsonSerializable(
  includeIfNull: false,
)
class TableData {
  @JsonKey(defaultValue: 0.0)
  double yuanAmount;
  @JsonKey(defaultValue: 0.0)
  double qiaoAmount;
  @JsonKey(defaultValue: 0.0)
  double maAmount;
  @JsonKey(defaultValue: 0.0)
  double baAmount;

  @JsonKey(defaultValue: false)
  bool yuanSchedule;
  @JsonKey(defaultValue: false)
  bool qiaoSchedule;
  @JsonKey(defaultValue: false)
  bool baSchedule;

  TableData(
      {this.yuanAmount,
      this.qiaoAmount,
      this.maAmount,
      this.baAmount,
      this.yuanSchedule,
      this.qiaoSchedule,
      this.baSchedule});

  factory TableData.fromJson(Map<String, dynamic> json) =>
      _$TableDataFromJson(json);

  Map<String, dynamic> toJson() => _$TableDataToJson(this);
}

class TableForm {
  final int index;

  TableForm({this.index});
}
