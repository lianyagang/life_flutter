import 'package:flutteradmin123/generated/json/base/json_convert_content.dart';

class LoginRespEntity with JsonConvert<LoginRespEntity> {
	String? username;
	int? expire;
	String? accessToken;
	String? refreshToken;
}
