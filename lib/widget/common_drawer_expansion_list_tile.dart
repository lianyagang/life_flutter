import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Desc:
/// <p>
/// Date: 2021/6/28
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class DrawerExpansionTileTile extends StatelessWidget {
  const DrawerExpansionTileTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.onExpansionChanged,
    required this.children,
    this.trailing,
  }) : super(key: key);

  final String title, svgSrc;
  final ValueChanged<bool>? onExpansionChanged;

  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: onExpansionChanged,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
      trailing: trailing,
      children: children,
      expandedAlignment: Alignment.centerLeft,
    );
  }
}
