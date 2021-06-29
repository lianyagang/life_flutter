import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteradmin123/base/view_model_provider.dart';

import 'LoginModel.dart';
import 'login_view_model.dart';

class LoginViewPage extends StatelessWidget {
  static final String sName = "/login";

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>(
      viewModel: LoginViewModel(LoginModel()),
      onModelReady: (model) {
        model.initialise(context);
      },
      child: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  final controllerForAccount = TextEditingController();
  final controllerForPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = context.viewModel<LoginViewModel>();

    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              //设置 child 居中
              alignment: Alignment.center,
              height: 80,
              width: 300,
              //边框设置
              decoration: new BoxDecoration(
                //背景
                color: Colors.grey,
                //设置四周圆角 角度
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                //设置四周边框
                border: new Border.all(width: 1, color: Colors.red),
              ),
              child: Text('请输入您注册时的邮箱或手机号，我们将向您发送电子邮箱或短信验证码以更改密码',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            child: TextFormField(
                controller: controllerForAccount,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "邮箱/手机号",
                    hintStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300)),
                maxLength: 13,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            child: TextFormField(
                controller: controllerForPwd,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "密码",
                    hintStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300)),
                maxLength: 13,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                )),
          ),
          Container(
            width: 200,
            height: 48.0,
            margin: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
            child: ElevatedButton(
              child: ValueListenableBuilder<String>(
                valueListenable: model.loginStatus,
                builder: (context, value, child) => Text(value),
              ),
              onPressed: () {
                model.toLogin(
                    context, controllerForAccount.text, controllerForPwd.text);
              },
            ),
          ),
        ]),
      )),
    );
  }
}
