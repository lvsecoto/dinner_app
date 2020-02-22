import 'package:dinner_app/domain/statistics/statistics.dart';

class QiaoStatistics implements Calculate {
  final QiaoSchedule schedule;

  QiaoStatistics(this.schedule);

  @override
  double calculate(Dinner dinner) {
    // TODO: implement calculate
    return null;
  }
}

enum QiaoSchedule {
  morning,
  midday,
  night,
}
