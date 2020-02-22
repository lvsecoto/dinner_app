import 'package:dinner_app/domain/statistics/statistics.dart';
import 'package:dinner_app/domain/statistics/yuan/yuan.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('测试Yuan的饭量', () {
    expect(
      2,
      YuanStatistics(schedule: YuanSchedule.has, riceAmount: 1.0)
          .calculate(Dinner.rice),
    );
    expect(
      1,
      YuanStatistics(schedule: YuanSchedule.notHas, riceAmount: 1.0)
          .calculate(Dinner.rice),
    );
    expect(
      null,
      YuanStatistics(schedule: null, riceAmount: 1.0).calculate(Dinner.rice),
    );
  });
}
