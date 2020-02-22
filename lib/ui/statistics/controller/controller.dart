import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StatisticsController extends ChangeNotifier {
  static StatisticsController get(BuildContext context) =>
      Provider.of<StatisticsController>(context, listen: false);

  double result;

  double yuanRiceAmount;

  void setYuanRiceAmount(double amount) {
    yuanRiceAmount = amount;
    cal();
  }

  double qiaoRiceAmount;

  void setQiaoRiceAmount(double amount) {
    qiaoRiceAmount = amount;
    cal();
  }

  double maRiceAmount;

  void setMaRiceAmount(double amount) {
    maRiceAmount = amount;
    cal();
  }

  double baRiceAmount;

  void setBaRiceAmount(double amount) {
    baRiceAmount = amount;
    cal();
  }

  bool yuanSchedule = false;

  void setYuanSchedule(bool has) {
    yuanSchedule = has;
    cal();
  }

  bool qiaoSchedule = false;

  void setQiaoSchedule(bool has) {
    qiaoSchedule = has;
    cal();
  }

  bool baSchedule = false;

  void setBaSchedule(bool has) {
    baSchedule = has;
    cal();
  }

  void cal() {
    if (yuanRiceAmount == null ||
        qiaoRiceAmount == null ||
        maRiceAmount == null ||
        baRiceAmount == null) {
      result = null;
      notifyListeners();
    } else {
      final yuanResult = yuanSchedule ? yuanRiceAmount * 2 : yuanRiceAmount;

      final qiaoResult = qiaoSchedule ? qiaoRiceAmount * 2 : qiaoRiceAmount;

      final maResult = maRiceAmount;

      final baResult = baSchedule ? baRiceAmount * 2 : baRiceAmount;

      result = yuanResult + qiaoResult + maResult + baResult;
      notifyListeners();
    }
  }
}
