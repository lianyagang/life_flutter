import 'package:flutteradmin123/function/admin/rightpage/authority/member/entity/admin_member_del_req_entity.dart';

adminMemberDelReqEntityFromJson(AdminMemberDelReqEntity data, Map<String, dynamic> json) {
	if (json['memberId'] != null) {
		data.memberId = json['memberId'] is String
				? double.tryParse(json['memberId'])
				: json['memberId'].toDouble();
	}
	return data;
}

Map<String, dynamic> adminMemberDelReqEntityToJson(AdminMemberDelReqEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['memberId'] = entity.memberId;
	return data;
}