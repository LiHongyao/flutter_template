import 'dart:async';
import 'package:flutter/material.dart';

/// 短信验证码
class CaptchaBox extends StatefulWidget {
  const CaptchaBox({Key? key, required this.onPressed, this.max = 60}) : super(key: key);

  final int max;
  final void Function(VoidCallback next) onPressed;

  @override
  State<CaptchaBox> createState() => _CaptchaBoxState();
}

class _CaptchaBoxState extends State<CaptchaBox> {
  int count = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  void getCaptcha() {
    // 判断当前是否可以启动倒计时
    if (count == 0) {
      setState(() {
        count = widget.max;
      });
      print("__启动定时器__");
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (count < 1) {
            timer.cancel();
          } else {
            count--;
          }
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
      onPressed: () {
        widget.onPressed(getCaptcha);
      },
      child: Text(
        count > 0 ? "$count秒后重新获取" : "获取验证码",
        style: TextStyle(fontSize: 14, color: count > 0 ? Colors.grey : Colors.blue),
      ),
    );
  }
}
