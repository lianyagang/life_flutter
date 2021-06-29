import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutteradmin123/base/http/request/interceptor/token_interceptor.dart';
import 'package:flutteradmin123/base/sp_utils/sp_cache.dart';
import 'package:flutteradmin123/base/sp_utils/sp_constant.dart';
import 'package:flutteradmin123/constant/http_constants.dart';

import 'http_error.dart';

class VvRequestClient {
  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;
  static const int HTTP_SUCCEED = 10000;
  static const String contentType = 'application/json; charset=UTF-8';

  static final VvRequestClient _instance = VvRequestClient._internal();

  factory VvRequestClient() => _instance;
  Dio? _client;

  Dio? get dioService => _client;

  /// 创建 dio 实例对象
  VvRequestClient._internal() {
    if (_client == null) {
      var options = BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          headers: {
            HttpHeaders.authorizationHeader:
                SpCache.getInstance().get(SpConstants.authorization),
          });

      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      _client = Dio(options);
      var interceptors = _client!.interceptors;
      interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true)); //开启请求日志
      interceptors.add(TokenInterceptor());
    }
  }
}

///http请求成功回调
typedef void HttpSuccessCallback<T>(T result);

///失败回调
typedef void HttpFailureCallback(HttpError err);
