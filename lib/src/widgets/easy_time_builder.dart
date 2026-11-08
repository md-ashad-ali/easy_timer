import 'package:easy_timer/easy_timer.dart';
import 'package:flutter/material.dart';

class EasyTimeBuilder extends StatelessWidget {
  final EasyTimeContoler easyTimeContoler;
  final Widget Function(BuildContext context, int second) builder;
  const EasyTimeBuilder({
    super.key,
    required this.easyTimeContoler,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: easyTimeContoler,
      builder: (context, child) =>
          builder(context, easyTimeContoler.curentSecond),
    );
  }
}
