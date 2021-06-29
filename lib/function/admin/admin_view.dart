import 'package:flutter/material.dart';
import 'package:flutteradmin123/base/view_model_provider.dart';
import 'package:flutteradmin123/function/admin/rightpage/admin_right_view_page.dart';

import 'admin_model.dart';
import 'admin_view_model.dart';
import 'leftpage/admin_left_view_page.dart';

/// Desc:
/// <p>
/// Date: 2021/6/19
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class AdminViewPage extends StatelessWidget {
  static final String sName = "/admin";

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AdminViewModel>(
      viewModel: AdminViewModel(AdminModel()),
      onModelReady: (_model) => _model.initialise(context),
      child: _AdminView(),
    );
  }
}

class _AdminView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdminViewModel viewModel = context.viewModel<AdminViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: LeftTabViewPage(
                viewModel: viewModel,
              ),
            ),
            Expanded(flex: 5, child: RightViewPage(viewModel: viewModel,)),
          ],
        ),
      ),
    );
  }
}
