import 'package:dinner_app/ui/statistics/controller/table_list_controller.dart';
import 'package:dinner_app/ui/statistics/page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TableAllController>(
      builder: (__, controller, _) {
        if (controller.tables == null) {
          return Center(child: Text("加载中"));
        }

        return ListView(
          children: <Widget>[
            ...controller.tables?.map((e) {
              return ListTile(
                title: Text(e.name ?? e.index),
                onTap: () async {
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
