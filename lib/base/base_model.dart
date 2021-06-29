/// Desc:
/// <p>
/// Date: 2021/6/19
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang


import 'base_i_model.dart';
import 'http/network/vv_net_work.dart';
import 'http/request/base_request_option.dart';

///基础数据仓库层
class BaseModel with BaseRequestOptionsMixin implements IModel {
  late VvRequestClient _apiService;

  BaseModel() {
    this._apiService = VvRequestClient();
  }

  @override
  void onClear() {
    cancelRequest();
  }

  VvRequestClient get apiService => _apiService;
}
