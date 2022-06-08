/// 根组件
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/routes/routes.dart';
import 'package:flutter_template/utils/http.dart';
import 'package:flutter_template/widgets/tap_dismiss_keyboard.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    /** 三方插件初始化 */
    Http.setUp();
    EasyLoading.instance.maskType = EasyLoadingMaskType.clear;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter-App",
      navigatorKey: navigatorKey,
      // 默认路由：启动页
      initialRoute: Routes.launcherPage,
      // 映射路由
      routes: Routes.routes,
      // 关闭调试条
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return TapDismissKeyboard(
          child: FlutterEasyLoading(child: widget),
        );
      },
    );
  }
}
