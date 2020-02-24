import 'package:dinner_app/ui/statistics/controller/table_list_controller.dart';
import 'package:dinner_app/ui/statistics/statistics.dart';
import 'package:dinner_app/ui/statistics/widget/talbe_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget.dart';

class StatisticsContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("饭量统计"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              var controller = Provider.of<DataController>(
                  context, listen: false);
              var index = controller.tableIndex;
              var newIndex = await Provider.of<TableAllController>(
                  context, listen: false)
                  .delete(index, controller.tableData);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (_) =>
                          StatisticsPageWidget(
                              tableIndex: newIndex)));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Text(
                    "表格一览",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add, color: Colors.blue),
                        onPressed: () async {
                          var newTableIndex =
                          await Provider.of<TableAllController>(context,
                              listen: false)
                              .addTable();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) =>
                                      StatisticsPageWidget(
                                          tableIndex: newTableIndex)));
                        },
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: theme.primaryColor,
              ),
            ),
            Expanded(
              child: TableListWidget(),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: TableWidget(),
            ),
          ),
          SummaryWidget(),
        ],
      ),
    );
  }
}
