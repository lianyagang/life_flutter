import 'package:flutteradmin123/function/login/entity/login_resp_entity.dart';

loginRespEntityFromJson(LoginRespEntity data, Map<String, dynamic> json) {
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['expire'] != null) {
		data.expire = json['expire'] is String
				? int.tryParse(json['expire'])
				: json['expire'].toInt();
	}
	if (json['accessToken'] != null) {
		data.accessToken = json['accessToken'].toString();
	}
	if (json['refreshToken'] != null) {
		data.refreshToken = json['refreshToken'].toString();
	}
	return data;
}

Map<String, dynamic> loginRespEntityToJson(LoginRespEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['username'] = entity.username;
	data['expire'] = entity.expire;
	data['accessToken'] = entity.accessToken;
	data['refreshToken'] = entity.refreshToken;
	return data;
}