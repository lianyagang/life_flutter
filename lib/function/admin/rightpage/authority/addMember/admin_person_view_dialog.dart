import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteradmin123/base/view_model_provider.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/addMember/admin_person_dialog_view_model.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/addMember/admin_person_model.dart';
import 'package:flutteradmin123/widget/common_text_input.dart';

/// Desc:
/// <p>
/// Date: 2021/6/27
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class AdminPersonAddDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AdminPersonAddViewModel>(
      viewModel: AdminPersonAddViewModel(AdminPersonModel()),
      onModelReady: (_model) => _model.initialise(context),
      child: _AdminPersonDialogView(),
    );
  }
}

class _AdminPersonDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdminPersonAddViewModel viewModel =
        context.viewModel<AdminPersonAddViewModel>();

    final controllerForAccount = TextEditingController();
    final controllerForPwd = TextEditingController();
    final controllerForName = TextEditingController();
    final controllerForEmail = TextEditingController();
    final controllerForPhone = TextEditingController();

    return SizedBox(
      width: 650,
      height: 500,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CommonTextFileInput(
                controller: controllerForAccount,
                keyboardType: TextInputType.name,
                hintText: "账号",
              ),
              CommonTextFileInput(
                controller: controllerForPwd,
                keyboardType: TextInputType.visiblePassword,
                hintText: "密码",
              ),
              CommonTextFileInput(
                controller: controllerForName,
                keyboardType: TextInputType.name,
                hintText: "姓名",
              ),
              CommonTextFileInput(
                controller: controllerForEmail,
                keyboardType: TextInputType.emailAddress,
                hintText: "邮箱",
              ),
              CommonTextFileInput(
                controller: controllerForPhone,
                keyboardType: TextInputType.phone,
                hintText: "电话",
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.addPerson(
                      context,
                      controllerForAccount.text,
                      controllerForPwd.text,
                      controllerForName.text,
                      controllerForEmail.text,
                      controllerForPhone.text,
                    );
                  },
                  child: Text('添加')),
            ],
          ),
        ),
      ),
    );
  }
}
