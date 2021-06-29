import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteradmin123/function/admin/entity/admin_left_type.dart';
import 'package:flutteradmin123/function/admin/rightpage/home/admin_home_view_page.dart';

import '../admin_view_model.dart';
import 'authority/member/admin_member_view_page.dart';
import 'authority/tab/data_table2_simple.dart';
import 'authority/tab/paginated_data_table2.dart';

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
class RightViewPage extends StatelessWidget {
  final AdminViewModel viewModel;

  RightViewPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder<AdminLeftType>(
          valueListenable: viewModel.leftType,
          builder: (context, type, child) {
            switch (type) {
              case AdminLeftType.HOME:
                return AdminHomeViewPage();
              case AdminLeftType.AUTHORITY_MEMBER:
                return AdminMemberViewPage();
              default:
                return AdminHomeViewPage();

            }
            return SizedBox();
          }),
    );
  }
}
