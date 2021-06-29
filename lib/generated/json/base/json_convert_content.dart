// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutteradmin123/function/login/entity/register_entity_entity.dart';
import 'package:flutteradmin123/generated/json/register_entity_entity_helper.dart';
import 'package:flutteradmin123/base/http/request/entity/base_resp_entity.dart';
import 'package:flutteradmin123/generated/json/base_resp_entity_helper.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/addMember/entity/admin_add_person_req_entity.dart';
import 'package:flutteradmin123/generated/json/admin_add_person_req_entity_helper.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/member/entity/admin_member_list_resp_entity.dart';
import 'package:flutteradmin123/generated/json/admin_member_list_resp_entity_helper.dart';
import 'package:flutteradmin123/function/admin/entity/admin_member_resp_entity.dart';
import 'package:flutteradmin123/generated/json/admin_member_resp_entity_helper.dart';
import 'package:flutteradmin123/function/login/entity/login_resp_entity.dart';
import 'package:flutteradmin123/generated/json/login_resp_entity_helper.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/member/entity/admin_member_del_req_entity.dart';
import 'package:flutteradmin123/generated/json/admin_member_del_req_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case RegisterEntityEntity:
				return registerEntityEntityFromJson(data as RegisterEntityEntity, json) as T;
			case BaseRespEntity:
				return baseRespEntityFromJson(data as BaseRespEntity, json) as T;
			case AdminAddPersonReqEntity:
				return adminAddPersonReqEntityFromJson(data as AdminAddPersonReqEntity, json) as T;
			case AdminMemberListRespEntity:
				return adminMemberListRespEntityFromJson(data as AdminMemberListRespEntity, json) as T;
			case AdminMemberListRespMemberVO:
				return adminMemberListRespMemberVOFromJson(data as AdminMemberListRespMemberVO, json) as T;
			case AdminMemberListRespMemberInfoVO:
				return adminMemberListRespMemberInfoVOFromJson(data as AdminMemberListRespMemberInfoVO, json) as T;
			case AdminMemberRespEntity:
				return adminMemberRespEntityFromJson(data as AdminMemberRespEntity, json) as T;
			case AdminMemberRespMemberVO:
				return adminMemberRespMemberVOFromJson(data as AdminMemberRespMemberVO, json) as T;
			case AdminMemberRespMemberInfoVO:
				return adminMemberRespMemberInfoVOFromJson(data as AdminMemberRespMemberInfoVO, json) as T;
			case LoginRespEntity:
				return loginRespEntityFromJson(data as LoginRespEntity, json) as T;
			case AdminMemberDelReqEntity:
				return adminMemberDelReqEntityFromJson(data as AdminMemberDelReqEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case RegisterEntityEntity:
				return registerEntityEntityToJson(data as RegisterEntityEntity);
			case BaseRespEntity:
				return baseRespEntityToJson(data as BaseRespEntity);
			case AdminAddPersonReqEntity:
				return adminAddPersonReqEntityToJson(data as AdminAddPersonReqEntity);
			case AdminMemberListRespEntity:
				return adminMemberListRespEntityToJson(data as AdminMemberListRespEntity);
			case AdminMemberListRespMemberVO:
				return adminMemberListRespMemberVOToJson(data as AdminMemberListRespMemberVO);
			case AdminMemberListRespMemberInfoVO:
				return adminMemberListRespMemberInfoVOToJson(data as AdminMemberListRespMemberInfoVO);
			case AdminMemberRespEntity:
				return adminMemberRespEntityToJson(data as AdminMemberRespEntity);
			case AdminMemberRespMemberVO:
				return adminMemberRespMemberVOToJson(data as AdminMemberRespMemberVO);
			case AdminMemberRespMemberInfoVO:
				return adminMemberRespMemberInfoVOToJson(data as AdminMemberRespMemberInfoVO);
			case LoginRespEntity:
				return loginRespEntityToJson(data as LoginRespEntity);
			case AdminMemberDelReqEntity:
				return adminMemberDelReqEntityToJson(data as AdminMemberDelReqEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (RegisterEntityEntity).toString()){
			return RegisterEntityEntity().fromJson(json);
		}	else if(type == (BaseRespEntity).toString()){
			return BaseRespEntity().fromJson(json);
		}	else if(type == (AdminAddPersonReqEntity).toString()){
			return AdminAddPersonReqEntity().fromJson(json);
		}	else if(type == (AdminMemberListRespEntity).toString()){
			return AdminMemberListRespEntity().fromJson(json);
		}	else if(type == (AdminMemberListRespMemberVO).toString()){
			return AdminMemberListRespMemberVO().fromJson(json);
		}	else if(type == (AdminMemberListRespMemberInfoVO).toString()){
			return AdminMemberListRespMemberInfoVO().fromJson(json);
		}	else if(type == (AdminMemberRespEntity).toString()){
			return AdminMemberRespEntity().fromJson(json);
		}	else if(type == (AdminMemberRespMemberVO).toString()){
			return AdminMemberRespMemberVO().fromJson(json);
		}	else if(type == (AdminMemberRespMemberInfoVO).toString()){
			return AdminMemberRespMemberInfoVO().fromJson(json);
		}	else if(type == (LoginRespEntity).toString()){
			return LoginRespEntity().fromJson(json);
		}	else if(type == (AdminMemberDelReqEntity).toString()){
			return AdminMemberDelReqEntity().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<RegisterEntityEntity>[] is M){
			return data.map<RegisterEntityEntity>((e) => RegisterEntityEntity().fromJson(e)).toList() as M;
		}	else if(<BaseRespEntity>[] is M){
			return data.map<BaseRespEntity>((e) => BaseRespEntity().fromJson(e)).toList() as M;
		}	else if(<AdminAddPersonReqEntity>[] is M){
			return data.map<AdminAddPersonReqEntity>((e) => AdminAddPersonReqEntity().fromJson(e)).toList() as M;
		}	else if(<AdminMemberListRespEntity>[] is M){
			return data.map<AdminMemberListRespEntity>((e) => AdminMemberListRespEntity().fromJson(e)).toList() as M;
		}	else if(<AdminMemberListRespMemberVO>[] is M){
			return data.map<AdminMemberListRespMemberVO>((e) => AdminMemberListRespMemberVO().fromJson(e)).toList() as M;
		}	else if(<AdminMemberListRespMemberInfoVO>[] is M){
			return data.map<AdminMemberListRespMemberInfoVO>((e) => AdminMemberListRespMemberInfoVO().fromJson(e)).toList() as M;
		}	else if(<AdminMemberRespEntity>[] is M){
			return data.map<AdminMemberRespEntity>((e) => AdminMemberRespEntity().fromJson(e)).toList() as M;
		}	else if(<AdminMemberRespMemberVO>[] is M){
			return data.map<AdminMemberRespMemberVO>((e) => AdminMemberRespMemberVO().fromJson(e)).toList() as M;
		}	else if(<AdminMemberRespMemberInfoVO>[] is M){
			return data.map<AdminMemberRespMemberInfoVO>((e) => AdminMemberRespMemberInfoVO().fromJson(e)).toList() as M;
		}	else if(<LoginRespEntity>[] is M){
			return data.map<LoginRespEntity>((e) => LoginRespEntity().fromJson(e)).toList() as M;
		}	else if(<AdminMemberDelReqEntity>[] is M){
			return data.map<AdminMemberDelReqEntity>((e) => AdminMemberDelReqEntity().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}