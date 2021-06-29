import 'package:flutteradmin123/function/admin/rightpage/authority/addMember/entity/admin_add_person_req_entity.dart';

adminAddPersonReqEntityFromJson(AdminAddPersonReqEntity data, Map<String, dynamic> json) {
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['password'] != null) {
		data.password = json['password'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone'].toString();
	}
	return data;
}

Map<String, dynamic> adminAddPersonReqEntityToJson(AdminAddPersonReqEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['username'] = entity.username;
	data['password'] = entity.password;
	data['name'] = entity.name;
	data['email'] = entity.email;
	data['phone'] = entity.phone;
	return data;
}