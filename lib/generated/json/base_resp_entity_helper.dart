import 'package:flutteradmin123/base/http/request/entity/base_resp_entity.dart';

baseRespEntityFromJson(BaseRespEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['data'] != null) {
		data.data = json['data'];
	}
	if (json['ok'] != null) {
		data.ok = json['ok'];
	}
	return data;
}

Map<String, dynamic> baseRespEntityToJson(BaseRespEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data;
	data['ok'] = entity.ok;
	return data;
}