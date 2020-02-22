import 'package:dinner_app/domain/statistics/statistics.dart';

class YuanStatistics implements Calculate {
  /// 明天排班
  final YuanSchedule schedule;

  /// 饭量
  final double riceAmount;

  YuanStatistics({this.schedule, this.riceAmount});

  @override
  double calculate(Dinner dinner) {
    switch (dinner) {
      case Dinner.rice:
        if (schedule == null) {
          return null;
        }
        switch (schedule) {
          case YuanSchedule.has:
            return riceAmount * 2;
            break;
          case YuanSchedule.notHas:
            return riceAmount * 1;
            break;
        }
        break;
    }
  }
}

enum YuanSchedule {
  has,
  notHas,
}
