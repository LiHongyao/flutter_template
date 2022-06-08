/// -- 程序启动页

import 'package:flutter/material.dart';
import 'package:flutter_template/routes/routes.dart';
import 'package:flutter_template/utils/hex_color.dart';

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
    bool shouldLogin = true;
    // 延迟执行
    Future.delayed(const Duration(seconds: 1), () {
      if (shouldLogin) {
        Navigator.pushReplacementNamed(context, Routes.loginPage);
      } else {
        Navigator.pushReplacementNamed(context, Routes.tabPage,arguments: {"index": 0});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: HexColor('#AD2D24'),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: const [BoxShadow(color: Colors.green, offset: Offset(0, 6), blurRadius: 1, spreadRadius: 0)],
            ),
            child: const Center(
              child: Text(
                "北",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: const Text(
              "百川志愿者点单系统",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
