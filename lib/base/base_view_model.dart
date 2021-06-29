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
import 'package:flutter/material.dart' hide Action;

import 'base_model.dart';
import 'http/network/http_error.dart';
import 'http/network/vv_net_work.dart';

class BaseViewModel<T extends BaseModel> extends ChangeNotifier {
  late T model;

  bool _disposed = false;

  bool get disposed => _disposed;

  BaseViewModel(this.model);

  @override
  void dispose() {
    _disposed = true;
    if (model is BaseModel) {
      model.onClear();
    }
    super.dispose();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  void launch(Future<void> Function() future, HttpFailureCallback err,
      {bool ignoreToast = false,
      bool showLoadingIndicator = false,
      bool isCancelable = true}) {
    future().catchError((onError) {
      ///错误所有的网络异常
      print("啥错误${onError.toString()}");
      err.call(HttpError.checkNetError(onError, ignoreToast: ignoreToast));
    });
  }
}
