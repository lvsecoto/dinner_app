import 'package:dinner_app/domain/statistics/statistics.dart';

class BaStatistics implements Calculate {
  final BaSchedule schedule;

  BaStatistics({this.schedule});

  @override
  double calculate(Dinner dinner) {
    // TODO: implement calculate
    return null;
  }
}

enum BaSchedule {
  has,
  notHas,
}
