import 'package:flutter/material.dart';
import 'package:flutteradmin123/widget/common_confirm_dialog.dart';

import 'admin_member_list_resp_entity.dart';

/// Desc:
/// <p>
/// Date: 2021/6/25
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class AdminMemberDataSource extends DataTableSource {

  List<AdminMemberListRespEntity> desserts;
  BuildContext context;
  final Function(BuildContext dialogContext,int) onPressed;
  AdminMemberDataSource(this.context, this.desserts, this.onPressed) {
    if (desserts.length == 0) {
      this.desserts = [];
    }
  }

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= desserts.length) throw 'index > _desserts.length';
    final dessert = desserts[index];
    AdminMemberListRespMemberVO? data = dessert.memberVO;
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text((data?.id ?? 'NAV').toString())),
        DataCell(Text(
          data?.username ?? 'NAV',
        )),
        DataCell(Text(
          data?.username ?? 'NAV',
        )),
        DataCell(Text(
          data?.email ?? 'NAV',
        )),
        DataCell(Text(
          data?.createdAt ?? 'NAV',
        )),
        DataCell(ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: CommonConfirmDialog((){
                  onPressed(context,index);
                }),
              ),
            );
          },
          child: Text('删除'),
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => desserts.length;

  @override
  int get selectedRowCount => 0;
}
