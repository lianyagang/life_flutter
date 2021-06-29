import 'package:flutteradmin123/function/admin/entity/admin_member_resp_entity.dart';

adminMemberRespEntityFromJson(AdminMemberRespEntity data, Map<String, dynamic> json) {
	if (json['memberVO'] != null) {
		data.memberVO = AdminMemberRespMemberVO().fromJson(json['memberVO']);
	}
	if (json['memberInfoVO'] != null) {
		data.memberInfoVO = AdminMemberRespMemberInfoVO().fromJson(json['memberInfoVO']);
	}
	return data;
}

Map<String, dynamic> adminMemberRespEntityToJson(AdminMemberRespEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['memberVO'] = entity.memberVO?.toJson();
	data['memberInfoVO'] = entity.memberInfoVO?.toJson();
	return data;
}

adminMemberRespMemberVOFromJson(AdminMemberRespMemberVO data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? double.tryParse(json['id'])
				: json['id'].toDouble();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['googleStatus'] != null) {
		data.googleStatus = json['googleStatus'] is String
				? double.tryParse(json['googleStatus'])
				: json['googleStatus'].toDouble();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? double.tryParse(json['status'])
				: json['status'].toDouble();
	}
	if (json['createdAt'] != null) {
		data.createdAt = json['createdAt'].toString();
	}
	return data;
}

Map<String, dynamic> adminMemberRespMemberVOToJson(AdminMemberRespMemberVO entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['googleStatus'] = entity.googleStatus;
	data['email'] = entity.email;
	data['phone'] = entity.phone;
	data['status'] = entity.status;
	data['createdAt'] = entity.createdAt;
	return data;
}

adminMemberRespMemberInfoVOFromJson(AdminMemberRespMemberInfoVO data, Map<String, dynamic> json) {
	if (json['memberId'] != null) {
		data.memberId = json['memberId'] is String
				? double.tryParse(json['memberId'])
				: json['memberId'].toDouble();
	}
	if (json['profilePhoto'] != null) {
		data.profilePhoto = json['profilePhoto'].toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender'] is String
				? double.tryParse(json['gender'])
				: json['gender'].toDouble();
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday'].toString();
	}
	if (json['countryCode'] != null) {
		data.countryCode = json['countryCode'].toString();
	}
	if (json['country'] != null) {
		data.country = json['country'].toString();
	}
	if (json['province'] != null) {
		data.province = json['province'].toString();
	}
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['district'] != null) {
		data.district = json['district'].toString();
	}
	if (json['gradeLevel'] != null) {
		data.gradeLevel = json['gradeLevel'].toString();
	}
	if (json['loginCount'] != null) {
		data.loginCount = json['loginCount'] is String
				? double.tryParse(json['loginCount'])
				: json['loginCount'].toDouble();
	}
	if (json['loginErrorCount'] != null) {
		data.loginErrorCount = json['loginErrorCount'] is String
				? double.tryParse(json['loginErrorCount'])
				: json['loginErrorCount'].toDouble();
	}
	if (json['lastLogin'] != null) {
		data.lastLogin = json['lastLogin'].toString();
	}
	return data;
}

Map<String, dynamic> adminMemberRespMemberInfoVOToJson(AdminMemberRespMemberInfoVO entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['memberId'] = entity.memberId;
	data['profilePhoto'] = entity.profilePhoto;
	data['gender'] = entity.gender;
	data['birthday'] = entity.birthday;
	data['countryCode'] = entity.countryCode;
	data['country'] = entity.country;
	data['province'] = entity.province;
	data['city'] = entity.city;
	data['district'] = entity.district;
	data['gradeLevel'] = entity.gradeLevel;
	data['loginCount'] = entity.loginCount;
	data['loginErrorCount'] = entity.loginErrorCount;
	data['lastLogin'] = entity.lastLogin;
	return data;
}