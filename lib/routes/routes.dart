import 'package:flutter_template/view/exapmles/life_cycle_page.dart';
import 'package:flutter_template/view/launcher.dart';
import 'package:flutter_template/view/login/login_page.dart';
import 'package:flutter_template/view/details/details_page.dart';
import 'package:flutter_template/view/tabs/tabs.dart';

/// 路由表
class Routes {
  // -- 禁止实例化
  Routes._();
  // -- 定义常量
  static String loginPage = "LOGIN_PAGE";
  static String tabPage = "TAB_PAGE";
  static String detailsPage = "DETAILS_PAGE";
  static String launcherPage = "LAUNCHER_PAGE";
  static String lifeCyclePage = "LIFE_CYCLE_PAGE";

  // -- 路由映射
  static var routes = {
    launcherPage: (context) => const Launcher(),
    tabPage: (context) => const Tabs(),
    loginPage: (context) => const Login(),
    detailsPage: (context) => const Details(),
    lifeCyclePage: (context) => const LifeCycle()
  };
}
