import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/routes/routes.dart';
import 'package:flutter_template/utils/validate.dart';
import 'package:flutter_template/viewmodel/login_viewmodel.dart';
import 'package:flutter_template/widgets/captcha_box.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /// properties
  final viewModel = LoginViewModel();
  final mobileController = TextEditingController();
  final captchaController = TextEditingController();

  /// life circles
  @override
  void initState() {
    super.initState();
    mobileController.addListener(() {
      viewModel.mobile = mobileController.text;
    });
    captchaController.addListener(() {
      viewModel.captcha = captchaController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    mobileController.dispose();
    captchaController.dispose();
  }

  /// methods///

  void login() {
    print("__login__");
    FocusManager.instance.primaryFocus?.unfocus();
    viewModel.login(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<LoginViewModel>(
        create: (BuildContext context) => viewModel,
        child: Consumer<LoginViewModel>(
          builder: (context, model, child) => ListView(
            padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
            children: [
              // TODO: logo
              Image.network(
                "https://qn.d-dou.com/dcep/dbean/99f3d21c7d554f55a8a3edeca99f6a23a0wib0.jpeg",
                height: 220,
              ),
              const SizedBox(height: 50),
              // TODO: 手机号
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 11,
                decoration: const InputDecoration(
                  hintText: "请输入手机号",
                ),
              ),
              const SizedBox(height: 20),
              // TODO: 验证码
              Stack(
                children: [
                  TextField(
                    controller: captchaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "请输入验证码"),
                  ),
                  Positioned(
                    right: 0,
                    child: CaptchaBox(
                      onPressed: (next) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (mobileController.text.isEmpty) {
                          EasyLoading.showToast("请输入手机号");
                        } else if (!Validate.checkMobile(
                            mobileController.text)) {
                          EasyLoading.showToast("手机号码不合法");
                        } else {
                          viewModel.sendCaptcha();
                          next();
                        }
                      },
                    ),
                  )
                ],
              ),
              // TODO: 登录按钮
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  onPressed: login,
                  child: const Text('登录',
                      style: TextStyle(fontSize: 16, letterSpacing: 4)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
