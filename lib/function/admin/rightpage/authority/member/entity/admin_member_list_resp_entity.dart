import 'package:flutteradmin123/generated/json/base/json_convert_content.dart';

class AdminMemberListRespEntity with JsonConvert<AdminMemberListRespEntity> {
	AdminMemberListRespMemberVO? memberVO;
	AdminMemberListRespMemberInfoVO? memberInfoVO;
}

class AdminMemberListRespMemberVO with JsonConvert<AdminMemberListRespMemberVO> {
	double? id;
	String? username;
	double? googleStatus;
	String? email;
	String? phone;
	double? status;
	String? createdAt;
}

class AdminMemberListRespMemberInfoVO with JsonConvert<AdminMemberListRespMemberInfoVO> {
	double? memberId;
	String? profilePhoto;
	double? gender;
	String? birthday;
	String? countryCode;
	String? country;
	String? province;
	String? city;
	String? district;
	String? gradeLevel;
	double? loginCount;
	double? loginErrorCount;
	String? lastLogin;
}
