import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutteradmin123/base/http/network/net_exception.dart';
import 'package:flutteradmin123/base/http/network/vv_net_work.dart';

import 'entity/base_resp_entity.dart';

///具体实体类的请求操作
mixin BaseRequestOptionsMixin {
  static const String contentType = 'application/json; charset=UTF-8';
  CancelToken _cancelToken = CancelToken();

  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;
  static const int HTTP_SUCCEED = 0;
  dynamic emptyData;

  Future<BaseRespEntity<T>> request<T>(
    String requestUrl, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    bool isPost = true,
    Options? options,
    String? newBaseUrl,
  }) async {
    //设置默认值
    var dio = VvRequestClient().dioService;

    if (newBaseUrl != null && newBaseUrl.isNotEmpty) {
      dio!.options.baseUrl = newBaseUrl;
    }
    Response response = await dio!.request(requestUrl,
        data: data,
        queryParameters: queryParameters,
        cancelToken: _cancelToken,
        options: options ?? Options(method: (isPost ? 'POST' : 'GET')));
    if (response.statusCode == HttpStatus.ok) {
      var baseResult = response.data;
      if (baseResult['code'] == HTTP_SUCCEED) {
        var data = baseResult['data'];
        if (data != null) {
          try {
            BaseRespEntity<T> baseResEntity = BaseRespEntity()
              ..data = data
              ..code = baseResult['code']
              ..message = baseResult['message']
              ..ok = baseResult['ok'];
            return new Future.value(baseResEntity);
          } catch (e) {
            throw (new ResponseException(
                code: baseResult['code'],
                message: e.toString(),
                errorData: baseResult['data']));
          }
        } else {
          throw (new ResponseException(
              code: baseResult['code'],
              message: baseResult['message'],
              errorData: baseResult['data']));
        }
      } else {
        throw (new ResponseException(
            code: baseResult['code'],
            message: baseResult['message'],
            errorData: baseResult['data']));
      }
    } else {
      throw (new DioError(requestOptions: RequestOptions(path: requestUrl)));
    }
  }

  ///取消网络请求
  void cancelRequest() {
    if (!this._cancelToken.isCancelled) {
      this._cancelToken.cancel();
    }
  }
}
