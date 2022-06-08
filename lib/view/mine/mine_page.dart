import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/utils/hex_color.dart';

class Mine extends StatefulWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  /// 顶栏
  Widget topBar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [HexColor("#7DA1FF"), HexColor("#1946BB")],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 175,
          bottom: -30,
          child: Container(
            width: 350,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 65,
                  child: ClipOval(
                    child: Image.network(
                        'http://blogimages.jspang.com/blogtouxiang1.jpg'),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "李鸿耀",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "17398888669",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Platform.isAndroid);
    // if (Platform.isAndroid) {
    //   print("android");
    //   // 沉浸式导航
    //   SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //       statusBarColor: Colors.transparent,
    //       statusBarBrightness: Brightness.light,
    //     ),
    //   );
    // }
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: HexColor("#F8F8F8"),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("个人中心"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          topBar(),
          const SizedBox(height: 50),
          const Text("Hello"),
        ],
      ),
    );
  }
}
