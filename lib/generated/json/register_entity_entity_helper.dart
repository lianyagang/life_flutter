import 'package:flutteradmin123/function/login/entity/register_entity_entity.dart';

registerEntityEntityFromJson(RegisterEntityEntity data, Map<String, dynamic> json) {
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['password'] != null) {
		data.password = json['password'].toString();
	}
	return data;
}

Map<String, dynamic> registerEntityEntityToJson(RegisterEntityEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['username'] = entity.username;
	data['password'] = entity.password;
	return data;
}