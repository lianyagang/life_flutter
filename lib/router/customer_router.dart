import 'package:flutter/cupertino.dart';

/// Desc:
/// <p>
/// Date: 2021/6/18
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  //构造方法
  CustomRoute(
    this.widget,
    RouteSettings? settings,
  ) : super(
            settings: settings,
            transitionDuration: Duration(seconds: 0), //过渡时间
            pageBuilder: (
              //构造器
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn, //动画曲线
                )),
                child: child,
              );
            });
}
