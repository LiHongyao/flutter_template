import 'package:flutter/material.dart';

/// 点击隐藏键盘
class TapDismissKeyboard extends StatelessWidget {
  /// 点击隐藏键盘
  const TapDismissKeyboard({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
