/// -- 程序启动页

import 'package:flutter/material.dart';
import 'package:flutter_template/routes/routes.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  initState() {
    super.initState();
    /** 判断页面跳转逻辑 */
    bool shouldLogin = false;
    // 延迟执行
    Future.delayed(const Duration(seconds: 1), () {
      if (shouldLogin) {
        Navigator.pushReplacementNamed(context, Routes.loginPage);
      } else {
        Navigator.pushReplacementNamed(context, Routes.tabPage,
            arguments: {"index": 0});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          "https://qn.d-dou.com/dcep/dbean/ad0bb5432ef04ce389b12625108fd53csp27y0.png",
          height: 50,
        ),
      ),
    );
  }
}
