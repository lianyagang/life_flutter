/// Desc:
/// <p>
/// Date: 2021/6/25
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Example without datasource
class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo();

  @override
  Widget build(BuildContext context) {
    //setColumnSizeRatios(1, 2);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          smRatio: 0.75,
          lmRatio: 1.5,
          border: TableBorder.all(),
          columns: [
            DataColumn2(
              size: ColumnSize.S,
              label: Text('编号'),
            ),
            DataColumn(
              label: Text('账号'),
            ),
            DataColumn(
              label: Text('账号'),
            ),
            DataColumn(
              label: Text('邮箱'),
            ),
            DataColumn2(
              label: Text('添加时间'),
              numeric: true,
              size: ColumnSize.L,
            ),
          ],
          rows: List<DataRow>.generate(
              100,
                  (index) => DataRow(cells: [
                DataCell(Text('A' * (10 - index % 10))),
                DataCell(Text('B' * (10 - (index + 5) % 10))),
                DataCell(Text('C' * (15 - (index + 5) % 10))),
                DataCell(Text('D' * (15 - (index + 10) % 10))),
                DataCell(Text(((index + 0.1) * 25.4).toString()))
              ]))),
    );
  }
}