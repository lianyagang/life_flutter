import 'package:flutteradmin123/base/base_model.dart';
import 'package:flutteradmin123/habit.dart';

import 'admin_service_api.dart';
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
class AdminModel extends BaseModel {
  Future<List<AdminMemberRespEntity>> getAllUserName() =>
      request<List<AdminMemberRespEntity>>(
        AdminServiceApi.admin_url,
        isPost: false,
      ).check();
}
