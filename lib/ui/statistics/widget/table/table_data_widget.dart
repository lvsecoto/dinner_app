import 'package:flutter/material.dart';

import 'table.dart';

class TableDataWidget extends StatelessWidget {
  final String title;
  final double amount;
  final bool schedule;
  final void Function(bool) changedScheduler;
  final void Function(double) changedAmount;

  TableDataWidget({
    Key key,
    this.changedScheduler,
    this.changedAmount,
    this.title,
    this.amount,
    this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: theme.textTheme.title),
        Divider(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16),
            AmountWidget(defaultValue: amount, didChanged: changedAmount),
            SizedBox(height: 16),
            if (changedScheduler != null)
              ScheduleWidget(
                key: ValueKey(schedule),
                schedule: schedule,
                didChanged: changedScheduler,
              ),
            if (changedScheduler != null) SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
