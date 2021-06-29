import 'package:flutter/material.dart';
import 'package:flutteradmin123/base/sp_utils/sp_cache.dart';
import 'package:flutteradmin123/function/admin/admin_view.dart';
import 'package:flutteradmin123/function/admin/rightpage/authority/addMember/admin_person_view_dialog.dart';
import 'package:flutteradmin123/function/register/register_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base/sp_utils/sp_constant.dart';
import 'config/no_login_route_config.dart';
import 'constant/constants.dart';
import 'function/login/login_view.dart';
import 'navigator/bottom_navigator.dart';
import 'navigator/zero_navigator.dart';

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminState();
  }
}

class AdminState extends State<AdminApp> {
  ZeroRouteDelegate _routeDelegate = new ZeroRouteDelegate();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SpCache>(
      //初始化cache
      future: SpCache.preInit(),
      builder: (BuildContext context, AsyncSnapshot<SpCache> snapshot) {
        var widget = snapshot.connectionState == ConnectionState.done
            ? Router(routerDelegate: _routeDelegate)
            : Scaffold(
                body: Center(
                child: CircularProgressIndicator(),
              ));
        return MaterialApp(
          home: widget,
          theme:ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
        );
      },
    );
  }
}

class ZeroRouteDelegate extends RouterDelegate<ZeroRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ZeroRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  RouteStatus _routeStatus = RouteStatus.login;
  List<MaterialPage> pages = [];
  String? searchQuery;

  ZeroRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    //路由跳转
    ZeroNavigator.getInstance().registerRouteJump(
        RouteJumpListener(onJumpTo: (RouteStatus routeStatus, Map? args) {
      _routeStatus = routeStatus;

      notifyListeners();
    }));
  }

  @override
  Future<void> setNewRoutePath(ZeroRoutePath path) async {}

  bool get hasLogin =>
      SpCache.getInstance().get(SpConstants.authorization) != null;

  ///获取路由状态，如果页面不是注册状态并且未登录都强制跳登录，如果币种模型不为空则跳转币种详情
  RouteStatus get routeStatus {
    if (!noLoginRoute.contains(_routeStatus) && !hasLogin) {
      return _routeStatus = RouteStatus.login;
    } else {
      return _routeStatus;
    }
  }

  @override
  Widget build(BuildContext context) {
    //获取当前路由状态在页面List中的位置
    var index = getPageIndex(pages, routeStatus);
    List<MaterialPage> tempPages = pages;

    if (index != -1) {
      //此时说明需要打开的页面在List中已经存在，则需要将这个页面和其上面所有页面都出栈,此处要求栈内只有一个同页面的实例。
      tempPages = tempPages.sublist(0, index);
    }

    var page;
    switch (routeStatus) {
      case RouteStatus.home:
        pages.clear();
        page = pageWrap(BottomNavigator());
        break;
      case RouteStatus.login:
        pages.clear();
        if (hasLogin) {
          page = pageWrap(AdminViewPage());
          break;
        }
        page = pageWrap(LoginViewPage());
        break;
      case RouteStatus.register:
        page = pageWrap(RegisterPageView());
        break;
      case RouteStatus.admin_add_person:
        page = pageWrap(AdminPersonAddDialog());
        break;
      case RouteStatus.admin:
        page = pageWrap(AdminViewPage());
        break;
      default:
        page = pageWrap(LoginViewPage());
    }

    //重新创建一个数组，否则pages因引用没有改变路由不会生效
    tempPages = [...tempPages, page];
    //通知路由发生变化
    ZeroNavigator.getInstance().notify(tempPages, pages);

    pages = tempPages;

    return WillPopScope(
      //fix Android物理返回键，无法返回上一页问题@https://github.com/flutter/flutter/issues/66349
      onWillPop: () async => !await navigatorKey.currentState!.maybePop(),
      child: Navigator(
        key: navigatorKey,
        pages: pages,
        onPopPage: (route, result) {
          if (route.settings is MaterialPage) {
            //登录页未登录返回拦截
            if ((route.settings as MaterialPage).child is LoginViewPage) {
//              if (!hasLogin) {
//                showErrorToast("请先登录");
//                return false;
//              }
            }
          }
          //执行返回操作
          if (!route.didPop(result)) {
            return false;
          }
          var tempPages = [...pages];
          pages.removeLast();
          //通知路由发生变化
          ZeroNavigator.getInstance().notify(pages, tempPages);
          return true;
        },
      ),
    );
  }
}

///定义路由数据，path
class ZeroRoutePath {
  final String location;

  ZeroRoutePath.home() : location = "/";

  ZeroRoutePath.detail() : location = "/detail";
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginViewPage(),
      routes: <String, WidgetBuilder>{
        LoginViewPage.sName: (BuildContext context) => LoginViewPage(),
        RegisterPageView.sName: (BuildContext context) => RegisterPageView(),
        AdminViewPage.sName: (BuildContext context) => AdminViewPage()
      },
    );
  }
}
