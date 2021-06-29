import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteradmin123/base/view_model_provider.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/addMember/admin_person_view_dialog.dart';

import 'admin_member_model.dart';
import 'admin_member_view_model.dart';
import 'entity/admin_member_data_source.dart';
import 'entity/admin_member_list_resp_entity.dart';

/// Desc:用户列表
/// <p>
/// Date: 2021/6/25
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class AdminMemberViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AdminMemberViewModel>(
      viewModel: AdminMemberViewModel(AdminMemberModel()),
      onModelReady: (_model) => _model.initialise(context),
      child: _AdminMemberView(),
    );
  }
}

///获取用户数据
class _AdminMemberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdminMemberViewModel viewModel = context.viewModel<AdminMemberViewModel>();

    return ValueListenableBuilder<List<AdminMemberListRespEntity>>(
        valueListenable: viewModel.adminMemberList,
        builder: (context, data, child) {
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
                        onPressed: () {
                          showDialog<AdminMemberListRespEntity>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              child: AdminPersonAddDialog(),
                            ),
                          ).then((v) {
                            print("返回的是》》》》》》》》${v.toString()}");
                            if (v != null) {
                              viewModel.getAllUserName();
                            }
                          });
                        },
                        child: Text('添加'),
                      )
                    ],
                  )
                ],
              ),
            ),
            rowsPerPage: viewModel.rowPage.value,
            minWidth: 800,
            fit: FlexFit.tight,
            border: TableBorder.all(),
            onRowsPerPageChanged: (value) {
              print("onRowsPerPageChanged$value");
              viewModel.rowPage.value = value ?? 10;
            },
            initialFirstRowIndex: viewModel.rowIndex.value,
            onPageChanged: (rowIndex) {
              print("当前index$rowIndex");
              viewModel.rowIndex.value = rowIndex;
            },
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
              DataColumn(
                label: Text('操作'),
              ),
            ],
            empty: Center(
                child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.grey[200],
                    child: Text('No data'))),
            source: AdminMemberDataSource(context, data,
                (BuildContext dialogContext, index) {
              viewModel.removeMemberId(dialogContext, index);
            }),
          );
        });
  }
}
