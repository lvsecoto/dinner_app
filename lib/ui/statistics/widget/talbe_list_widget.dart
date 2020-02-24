import 'package:dinner_app/ui/statistics/controller/table_list_controller.dart';
import 'package:dinner_app/ui/statistics/page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TableAllController>(
      builder: (__, controller, _) {
        return ListView(
          children: <Widget>[
            ...controller.tables?.map((e) {
                  return ListTile(
                    title: Text(e.index.toString()),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) =>
                              StatisticsPageWidget(tableIndex: e.index)));
                    },
                  );
                }) ??
                []
          ],
        );
      },
    );
  }
}
