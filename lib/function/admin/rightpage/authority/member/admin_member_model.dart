import 'package:dio/dio.dart';
import 'package:flutteradmin123/base/base_model.dart';
import 'package:flutteradmin123/function/admin/admin_service_api.dart';
import 'package:flutteradmin123/habit.dart';

import 'entity/admin_member_del_req_entity.dart';
import 'entity/admin_member_list_resp_entity.dart';

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
class AdminMemberModel extends BaseModel {
  Future<List<AdminMemberListRespEntity>> getAllUserName() =>
      request<List<AdminMemberListRespEntity>>(
        AdminServiceApi.admin_url,
        isPost: false,
      ).check();

  Future<bool> removeMember(AdminMemberDelReqEntity data) =>
      request<bool>(
        AdminServiceApi.admin_remove_member_url,
        queryParameters:data.toJson(),
        options: Options(method: 'Delete'),
        isPost: false,
      ).checkBaseType();
}
