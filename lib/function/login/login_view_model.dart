import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteradmin123/function/admin/admin_view.dart';
import 'package:flutteradmin123/base/base_view_model.dart';
import 'package:flutteradmin123/base/sp_utils/sp_cache.dart';
import 'package:flutteradmin123/base/sp_utils/sp_constant.dart';
import 'package:flutteradmin123/constant/http_constants.dart';
import 'package:flutteradmin123/navigator/zero_navigator.dart';
import 'package:flutteradmin123/router/customer_router.dart';

import 'LoginModel.dart';
import 'entity/register_entity_entity.dart';

class LoginViewModel extends BaseViewModel<LoginModel> {
  bool hideErrorStyle = true;
  bool enableLogin = true;

  /// 天气背景
  ValueNotifier<String> loginStatus = ValueNotifier("登录");

  LoginViewModel(LoginModel model) : super(model);

  initialise(BuildContext _context) {}

  Future<void> toLogin(
      BuildContext context, String account, String password) async {
    loginStatus.value = 'login';
    if (account.isNotEmpty && password.isNotEmpty) {
      launch(() async {
        var data = RegisterEntityEntity()
          ..username = account
          ..password = password;
        var loginResp = await model.login(data);
        String? accessToken = loginResp.accessToken;
        authorizationStr = accessToken;
        SpCache.getInstance()
            .setString(SpConstants.authorization, accessToken ?? '');
        if (loginResp.username!.isNotEmpty) {
          // Navigator.of(context).push(CustomRoute(AdminViewPage(),RouteSettings(name: AdminViewPage.sName)));
          ZeroNavigator.getInstance().onJumpTo(RouteStatus.admin, null);

        }
      }, (err) {
        print('errrr${err.code}');
      });
    }
  }
}
