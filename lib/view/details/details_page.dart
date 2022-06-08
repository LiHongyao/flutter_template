

import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  String id = '';
  /// state
  @override
  initState() {
    super.initState();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    id = args['id'] as String;

  }

  /// events
  _goBack() {
    var backValues = {
      "name": "李鸿耀",
      "job": "全栈工程师"
    };
    /** 出栈：携带值传回上一个页面 */
    Navigator.pop(context, backValues);
  }

  /// build
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("详情"),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text("ID:$id"),
            const Text("This is Details page."),
            TextButton(onPressed: _goBack, child: const Text("Go Back"))
          ],
        ),

      ),
    );
  }
}






