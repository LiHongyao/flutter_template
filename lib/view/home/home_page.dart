import 'package:flutter/material.dart';
import 'package:flutter_template/routes/routes.dart';
import 'package:flutter_template/utils/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _onGoDetails() async {
    /** 跳转详情页：监听返回值 */
    var results = (await Navigator.pushNamed(context, Routes.detailsPage,
        arguments: {"id": 'JWT'})) as Map<String, dynamic>;
    /** 输出返回值 */
    debugPrint("name: ${results['name']}, job: ${results['job']}");
  }

  /// build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("首页"),
          elevation: 0,
        ),
        body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _onGoDetails, child: const Text("Go Details"))
              ],
            )));
  }
}
