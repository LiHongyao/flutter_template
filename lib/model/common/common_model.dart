import 'package:flutter_easyloading/flutter_easyloading.dart';

class CommonModel {
  CommonModel._();

  /// 发送短信验证码
  static void sendCaptcha(String mobile) async {
    print(mobile);
    print("__发送短信验证码__");
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.showToast("已发送");
    });
  }
}
