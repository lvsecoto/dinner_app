import 'package:dinner_app/domain/statistics/ba/ba.dart';
import 'package:dinner_app/domain/statistics/ma/ma.dart';
import 'package:dinner_app/domain/statistics/qiao/qiao.dart';
import 'package:dinner_app/domain/statistics/yuan/yuan.dart';

final statisticsRepository = StatisticsRepository();

class StatisticsRepository {
  double calculate(
    YuanStatistics yuanStatistics,
    QiaoStatistics qiaoStatistics,
    MaStatistics maStatistics,
    BaStatistics baStatistics,
    Dinner dinner,
  ) {
    return yuanStatistics.calculate(dinner) +
        qiaoStatistics.calculate(dinner) +
        maStatistics.calculate(dinner) +
        baStatistics.calculate(dinner);
  }
}

abstract class Calculate {
  double calculate(Dinner dinner);
}

enum Dinner { rice }
