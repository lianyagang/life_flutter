import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutteradmin123/base/base_view_model.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/member/entity/admin_member_list_resp_entity.dart';

import 'admin_person_model.dart';

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
class AdminPersonAddViewModel extends BaseViewModel<AdminPersonModel> {
  AdminPersonAddViewModel(AdminPersonModel model) : super(model);

  initialise(BuildContext context) {}

  Future<void> addPerson(BuildContext context, String account, String password,
      String name, String email, String phone) async {
    launch(() async {
      var result = await model.addPerson(account, password, name, email, phone);
      if (result) {
        AdminMemberListRespMemberVO memberVO = AdminMemberListRespMemberVO();
        memberVO.username = name;
        memberVO.phone = phone;
        memberVO.email = email;
        AdminMemberListRespEntity data = AdminMemberListRespEntity()
          ..memberVO = memberVO;
        Navigator.pop(context, data);
      }
    }, (err) {});
  }
}
