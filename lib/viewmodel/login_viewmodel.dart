import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/model/common/common_model.dart';
import 'package:flutter_template/model/user/user_model.dart';
import 'package:flutter_template/routes/routes.dart';
import 'package:flutter_template/utils/validate.dart';

/// 保存状态，处理业务逻辑，充当view跟model通信的桥梁
class LoginViewModel extends ChangeNotifier {
  String mobile = '';
  String captcha = '';

  void login(BuildContext context) {
    if (mobile.isEmpty) {
      EasyLoading.showToast("请输入手机号");
      return;
    }
    if (!Validate.checkMobile(mobile)) {
      EasyLoading.showToast("手机号不合法");
      return;
    }
    if (captcha.isEmpty) {
      EasyLoading.showToast("请输入验证码");
      return;
    }
    EasyLoading.show(status: "加载中...");

    UserModel.login(mobile, captcha).then((resp) {
      print("$mobile, $captcha");
      if (resp["code"] == 0) {
        print(resp);
        EasyLoading.dismiss();
        Navigator.pushReplacementNamed(context, Routes.tabPage,
            arguments: {"index": 0});
      } else {
        EasyLoading.showToast(resp["msg"]);
        return;
      }
    });
  }

  void sendCaptcha() {
    CommonModel.sendCaptcha(mobile);
  }
}
