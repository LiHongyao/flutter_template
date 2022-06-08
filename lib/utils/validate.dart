

class Validate {
  Validate._();
  static bool checkMobile(String phone) {
    RegExp reg = RegExp(r"^1[3-9]\d{9}$");
    return reg.hasMatch(phone);
  }
}

