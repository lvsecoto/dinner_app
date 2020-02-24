import 'package:flutter/material.dart';

class ScheduleWidget extends StatefulWidget {
  final void Function(bool) didChanged;
  final void Function(bool) sync;

  final bool schedule;

  const ScheduleWidget({Key key, this.schedule, this.didChanged, this.sync})
      : super(key: key);

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  bool has;

  @override
  void initState() {
    super.initState();
    has = widget.schedule ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
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
        ),

        SizedBox(width: 12),
        IconButton(
          icon: Icon(Icons.file_upload, color: theme.primaryColor),
          onPressed: () {
            if (widget.sync != null) {
              widget.sync(has);
            }
          },
        )
      ],
    );
  }
}
