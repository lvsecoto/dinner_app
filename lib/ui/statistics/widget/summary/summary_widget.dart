import 'package:dinner_app/ui/statistics/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SummaryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Divider(height: 1),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text("总计",
                      style: theme.textTheme.headline
                          .copyWith(color: theme.primaryColor)),
                  SizedBox(height: 4),
                  Consumer<StatisticsController>(
                    builder: (_, controller, __) {
                      if (controller.result != null) {
                        return Text(
                          controller.result.toStringAsFixed(2),
                          style: theme.textTheme.title,
                        );
                      } else {
                        return Text(
                          "未确定",
                          style: theme.textTheme.title.copyWith(
                            color: theme.errorColor,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
