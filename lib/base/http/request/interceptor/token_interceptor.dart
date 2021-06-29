import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutteradmin123/base/sp_utils/sp_cache.dart';
import 'package:flutteradmin123/base/sp_utils/sp_constant.dart';
import 'package:flutteradmin123/constant/http_constants.dart';

/// Desc:
/// <p>
/// Date: 2021/6/22
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Map<String, dynamic>? headers = options.headers;
    headers[HttpHeaders.authorizationHeader] = SpCache.getInstance().get(SpConstants.authorization);
    handler.next(options);
  }
}
