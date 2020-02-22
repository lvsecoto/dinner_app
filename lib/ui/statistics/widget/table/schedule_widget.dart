import 'package:flutter/material.dart';

class ScheduleWidget extends StatefulWidget {
  final void Function(bool) didChanged;

  const ScheduleWidget({Key key, this.didChanged}) : super(key: key);

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  bool has = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ChoiceChip(
          label: Text("上班"),
          selected: has,
          onSelected: (selected) {
            setState(() {
              has = true;
              if (widget.didChanged != null) {
                widget.didChanged(has);
              }
            });
          },
        ),
        SizedBox(width: 8),
        ChoiceChip(
          label: Text("不上班"),
          selected: !has,
          onSelected: (selected) {
            setState(() {
              has = false;
              if (widget.didChanged != null) {
                widget.didChanged(has);
              }
            });
          },
        )
      ],
    );
  }
}
