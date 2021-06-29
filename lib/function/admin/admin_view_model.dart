import 'package:flutter/cupertino.dart';
import 'package:flutteradmin123/base/base_view_model.dart';

import 'admin_model.dart';
import 'entity/admin_left_type.dart';
import 'entity/admin_member_resp_entity.dart';

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
class AdminViewModel extends BaseViewModel<AdminModel> {
  ValueNotifier<int> userCount = ValueNotifier(0);

  ValueNotifier<bool> expanded = ValueNotifier(false);
  ValueNotifier<bool> expandedAuthority = ValueNotifier(false);
  ValueNotifier<AdminLeftType> leftType = ValueNotifier(AdminLeftType.HOME);

  List<AdminMemberRespEntity>? adminMemberList;


  AdminViewModel(AdminModel model) : super(model);

  void initialise(BuildContext context) {
    // getAllUserName();
  }

  ///获取所有子账号信息
  void getAllUserName() {
    launch(() async {
      adminMemberList = await model.getAllUserName();
      userCount.value = adminMemberList!.length;
    }, (err) {});
  }

  ///删除子账号
  void deleteChileUser(String childUserId) {}

  ///增加子账号
  void addChildUser() {}
}
