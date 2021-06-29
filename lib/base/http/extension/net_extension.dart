import 'package:flutteradmin123/base/http/request/entity/base_resp_entity.dart';
import 'package:flutteradmin123/generated/json/base/json_convert_content.dart';

extension NetExtension<T> on Future<BaseRespEntity<T>> {
  Future<T> check() async {
    var baseResponseEntity = await this;
    return Future.value(JsonConvert.fromJsonAsT<T>(baseResponseEntity.data));
  }
}

///基础类型解析
extension NetBaseTypeExtension<T> on Future<BaseRespEntity<T>> {
  Future<T> checkBaseType() async {
    var baseResponseEntity = await this;
    return Future.value(baseResponseEntity.data as T);
  }
}
