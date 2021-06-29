import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';

import 'data_source.dart';
import 'isEmptyArg.dart';

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// The file was extracted from GitHub: https://github.com/flutter/gallery
// Changes and modifications by Maxim Saplin, 2021

class PaginatedDataTable2Demo extends StatefulWidget {
  const PaginatedDataTable2Demo();

  @override
  _PaginatedDataTable2DemoState createState() =>
      _PaginatedDataTable2DemoState();
}

class _PaginatedDataTable2DemoState extends State<PaginatedDataTable2Demo> {
  int _rowIndex = 0;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = true;
  int? _sortColumnIndex;
  late DessertDataSource _dessertsDataSource;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _dessertsDataSource = DessertDataSource(context);
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _dessertsDataSource.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      horizontalMargin: 20,
      checkboxHorizontalMargin: 12,
      showCheckboxColumn: false,
      columnSpacing: 0,
      wrapInCard: false,
      header: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('输入搜索'),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('重置'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('搜索'),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' 数据列表'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('添加'),
                )
              ],
            )
          ],
        ),
      ),
      rowsPerPage: _rowsPerPage,
      minWidth: 800,
      fit: FlexFit.tight,
      border: TableBorder.all(),
      onRowsPerPageChanged: (value) {
        setState(() {
          _rowsPerPage = value!;
        });
      },
      initialFirstRowIndex: _rowIndex,
      onPageChanged: (rowIndex) {
        setState(() {
          _rowIndex = rowIndex;
        });
      },
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      columns: [
        DataColumn(
          label: Text('编号'),
        ),
        DataColumn(
          label: Text('账号'),
          numeric: true,
        ),
        DataColumn(
          label: Text('姓名'),
          numeric: true,
        ),
        DataColumn(
          label: Text('邮箱'),
          numeric: true,
        ),
        DataColumn(
          label: Text('添加时间'),
          numeric: true,
        ),
      ],
      empty: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Text('No data'))),
      source: getIsEmpty(context)
          ? DessertDataSource.empty(context)
          : _dessertsDataSource,
    );
  }
}
