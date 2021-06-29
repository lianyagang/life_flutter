import 'package:flutteradmin123/generated/json/base/json_convert_content.dart';

class BaseRespEntity<T> with JsonConvert<BaseRespEntity> {
	int? code;
	String? message;
	dynamic? data;
	bool? ok;

}
