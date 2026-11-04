import 'package:easy_timer/easy_timer.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  final EasyTimeContoler easyTimeContoler;
  final TextStyle? textStyle;
  const CountDownTimer({super.key, required this.easyTimeContoler, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: easyTimeContoler,
        builder: (context,child){
        String formateTime = TimeFormate.formateSecond(easyTimeContoler.curentSecond);
        return Text(
          formateTime,
          style: textStyle ?? const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        );
        }
    );
  }
}
