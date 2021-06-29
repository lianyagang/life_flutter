import 'package:flutter/material.dart';
import 'package:flutteradmin123/function/admin/entity/admin_left_type.dart';
import 'package:flutteradmin123/widget/common_drawer_expansion_list_tile.dart';
import 'package:flutteradmin123/widget/common_drawer_list_tile.dart';

import '../admin_view_model.dart';

/// Desc:
/// <p>
/// Date: 2021/6/25
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class LeftTabViewPage extends StatelessWidget {
  final AdminViewModel viewModel;

  LeftTabViewPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: '首页',
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              viewModel.leftType.value = AdminLeftType.HOME;
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: viewModel.expanded,
            builder: (context, expanded, child) => DrawerExpansionTileTile(
              title: '商品',

              onExpansionChanged: (expanded) {
                viewModel.expanded.value = expanded;
              },
              svgSrc: "assets/icons/menu_tran.svg",
              children: [
                DrawerListTile(
                  title: '商品列表',
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {},
                ),
                DrawerListTile(
                  title: '添加商品',
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {},
                ),
                DrawerListTile(
                  title: '商品分类',
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {},
                ),
                DrawerListTile(
                  title: '商品类型',
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {},
                ),
                DrawerListTile(
                  title: '品牌管理',
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {},
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: '订单',
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          DrawerListTile(
            title: '营销',
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          ValueListenableBuilder<bool>(
            valueListenable: viewModel.expandedAuthority,
            builder: (context, expanded, child) => DrawerExpansionTileTile(
              title: '权限',
              trailing: Icon(
                expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              onExpansionChanged: (expanded) {
                viewModel.expandedAuthority.value = expanded;
              },
              svgSrc: "assets/icons/menu_task.svg",
              children: [
                DrawerListTile(
                  title: '用户列表',
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {
                    viewModel.leftType.value = AdminLeftType.AUTHORITY_MEMBER;
                  },
                ),
                DrawerListTile(
                  title: '角色列表',
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {
                    viewModel.leftType.value = AdminLeftType.AUTHORITY_MEMBER;
                  },
                ),
                DrawerListTile(
                  title: '菜单列表',
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {
                    viewModel.leftType.value = AdminLeftType.AUTHORITY_MEMBER;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
