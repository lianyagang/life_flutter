import 'package:flutteradmin123/base/base_model.dart';
import 'package:flutteradmin123/function/admin/admin_service_api.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/addMember/entity/admin_add_person_req_entity.dart';
import 'package:flutteradmin123/habit.dart';

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
class AdminPersonModel extends BaseModel {
  Future<bool> addPerson(String account, String password, String name,
      String email, String phone) {
    AdminAddPersonReqEntity addPersonReqEntity = AdminAddPersonReqEntity()
      ..username = account
      ..password = password
      ..name = name
      ..email = email
      ..phone = phone;
    return request<bool>(
      AdminServiceApi.admin_add_member_url,
      data: addPersonReqEntity,
    ).checkBaseType();
  }
}
