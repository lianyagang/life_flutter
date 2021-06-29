import 'dart:async';

import 'package:flutteradmin123/base/base_model.dart';
import 'package:flutteradmin123/habit.dart';

import 'entity/login_resp_entity.dart';
import 'entity/register_entity_entity.dart';
import 'login_service_api.dart';

class LoginModel extends BaseModel {
  Future<LoginRespEntity> login(RegisterEntityEntity loginReqUserEntity) =>
      request<LoginRespEntity>(
        LoginApiService.loginUrl,
        data: loginReqUserEntity.toJson(),
      ).check();
}
