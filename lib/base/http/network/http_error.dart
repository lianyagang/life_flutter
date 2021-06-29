import 'package:dio/dio.dart';

import 'net_exception.dart';

/// @desc  网络请求错误
/// @time 2020/11/12
/// @author lianyagang
class HttpError {
  ///HTTP 状态码
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;

  ///未知错误
  static const String UNKNOWN = "UNKNOWN";

  ///解析错误
  static const String PARSE_ERROR = "PARSE_ERROR";

  ///网络错误
  static const String NETWORK_ERROR = "NETWORK_ERROR";

  ///协议错误
  static const String HTTP_ERROR = "HTTP_ERROR";

  ///证书错误
  static const String SSL_ERROR = "SSL_ERROR";

  ///连接超时
  static const String CONNECT_TIMEOUT = "CONNECT_TIMEOUT";

  ///响应超时
  static const String RECEIVE_TIMEOUT = "RECEIVE_TIMEOUT";

  ///发送超时
  static const String SEND_TIMEOUT = "SEND_TIMEOUT";

  ///网络请求取消
  static const String CANCEL = "CANCEL";

  static const String netException = '无网络，请检查网络';

  ///定义调用原生aop代码
  static const String ANDROID_AOP = "habit";
  static const String ANDROID_AOP_LOGIN_METHOD = "go2Login";

  String code = '';

  String message = '';

  HttpError(this.code, this.message);

  HttpError.checkNetError(dynamic error, {bool ignoreToast = false}) {
    //声明一个调用对象，需要把kotlin中注册的ChannelName传入构造函数
    if (error is DioError) {
      message = error.message;
      switch (error.type) {
        case DioErrorType.connectTimeout:
          code = CONNECT_TIMEOUT;
          message = netException;
          break;
        case DioErrorType.receiveTimeout:
          code = RECEIVE_TIMEOUT;
          message = netException;
          break;
        case DioErrorType.sendTimeout:
          code = SEND_TIMEOUT;
          message = netException;
          break;
        case DioErrorType.response:
          var statusCode = error.response?.statusCode;
          code = HTTP_ERROR + statusCode.toString();
          message = netException;
          break;
        case DioErrorType.cancel:
          code = CANCEL;
          break;
        case DioErrorType.other:
          code = UNKNOWN;
          message = netException;
          break;
      }
    } else if (error is ResponseException) {
      code = error.code.toString();
      message = error.message;
    } else {
      code = UNKNOWN;
      message = error.toString();
    }
  }

  @override
  String toString() {
    return 'HttpError{code: $code, message: $message}';
  }
}
