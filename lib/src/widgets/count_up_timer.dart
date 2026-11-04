import 'package:flutter/material.dart';

import '../../easy_timer.dart';

class CountUpTimer extends StatelessWidget {
  final EasyTimeContoler easyTimeContoler;
  final TextStyle? textStyle;
  const CountUpTimer({
    super.key,
    required this.easyTimeContoler,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: easyTimeContoler,
      builder: (context, child) {
        String formateTime = TimeFormate.formateSecond(
          easyTimeContoler.curentSecond,
        );
        return Text(
          formateTime,
          style:
              textStyle ??
              const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
