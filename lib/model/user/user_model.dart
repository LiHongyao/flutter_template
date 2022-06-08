import 'package:oktoast/oktoast.dart';



/// 请求处理http操作
class UserModel {
  UserModel._();

  /// 登录
  static Future<Map<String, dynamic>> login(String mobile, String captcha) async {
    if (mobile == "17398888669" && captcha == "666666") {
      return {"code": 0, "token": "APP_TOKENs"} ;
    }
    return { "code": 400, "msg": "验证码错误"};
  }
}




