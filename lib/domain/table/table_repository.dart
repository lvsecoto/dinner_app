import 'dart:convert';

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
  Future<TableData> getTableData() async {
    final respone = await dio.get("/classes/table_data/LuF1000H",
        queryParameters: {"where": "\"arrayKey\":2"});
    var data = respone.data["kv"][0];
    print(data);
    return TableData.fromJson(data);
  }

  Future<void> updateTableDate(TableData tableData) async {
    var kvList = tableData
        .toJson()
        .entries
        .map((it) => {
              "kv.0.${it.key}": it.value,
            })
        .toList();

    for (var it in kvList) {
      await dio.put("/classes/table_data/LuF1000H", data: jsonEncode(it));
    }
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
