import 'package:flutter/cupertino.dart';
import 'package:flutteradmin123/base/base_view_model.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/member/entity/admin_member_del_req_entity.dart';

import 'admin_member_model.dart';
import 'entity/admin_member_list_resp_entity.dart';

/// Desc:
/// <p>
/// Date: 2021/6/19
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class AdminMemberViewModel extends BaseViewModel<AdminMemberModel> {
  AdminMemberViewModel(AdminMemberModel model) : super(model);
  ValueNotifier<int> rowPage = ValueNotifier(10);
  ValueNotifier<int> rowIndex = ValueNotifier(0);
  ValueNotifier<List<AdminMemberListRespEntity>> adminMemberList =
      ValueNotifier(List.empty(growable: true));
  List<AdminMemberListRespEntity> data = List.empty(growable: true);

  void initialise(BuildContext context) {
    getAllUserName();
  }

  ///获取所有子账号信息
  void getAllUserName() {
    data.clear();
    launch(() async {
      data = await model.getAllUserName();
      adminMemberList.value = data;
    }, (err) {});
  }

  void updateMemberList(AdminMemberListRespEntity memberListRespEntity) {
    data.add(memberListRespEntity);
    adminMemberList.value = data;
    print("新的数据》》》》》》》${adminMemberList.value.last.memberVO?.username}");
  }

  void removeMemberId(BuildContext context, int index) {
    AdminMemberListRespEntity adminMemberListRespEntity = data[index];
    double? memberId = adminMemberListRespEntity.memberVO?.id;
    if(memberId!=null){
      var delData = AdminMemberDelReqEntity()..memberId = memberId;
      launch(() async {
        var deleteSuccess = await model.removeMember(delData);
        if (deleteSuccess) {
          getAllUserName();
          Navigator.pop(context);
        }
      }, (err) {});
    }else{
      print('删除失败~~~~~');
    }

  }
}
