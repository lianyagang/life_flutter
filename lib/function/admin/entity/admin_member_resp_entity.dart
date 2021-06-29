import 'package:flutteradmin123/generated/json/base/json_convert_content.dart';

class AdminMemberRespEntity with JsonConvert<AdminMemberRespEntity> {
	AdminMemberRespMemberVO? memberVO;
	AdminMemberRespMemberInfoVO? memberInfoVO;
}

class AdminMemberRespMemberVO with JsonConvert<AdminMemberRespMemberVO> {
	double? id;
	String? username;
	double? googleStatus;
	String? email;
	String? phone;
	double? status;
	String? createdAt;
}

class AdminMemberRespMemberInfoVO with JsonConvert<AdminMemberRespMemberInfoVO> {
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
