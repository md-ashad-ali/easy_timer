import 'package:flutter_test/flutter_test.dart';
import 'package:easy_timer/easy_timer.dart';

void main() {
  group('EasyTimeController', () {
    test('countdown shurute second set hoy', () {
      final controller = EasyTimeContoler();
      controller.setDuration(second: 60, isCountDown: true);

      expect(controller.curentSecond, 60);
      expect(controller.state, TimerState.initial);
      controller.dispose();
    });

    test('countup shurute 0 theke shuru hoy', () {
      final controller = EasyTimeContoler();
      controller.setDuration(second: 60, isCountDown: false);

      expect(controller.curentSecond, 0);
      controller.dispose();
    });

    test('start dile state running hoy', () {
      final controller = EasyTimeContoler();
      controller.setDuration(second: 10, isCountDown: true);
      controller.start();

      expect(controller.state, TimerState.runing);
      controller.dispose();
    });

    test('pause dile state paused hoy', () {
      final controller = EasyTimeContoler();
      controller.setDuration(second: 10, isCountDown: true);
      controller.start();
      controller.pause();

      expect(controller.state, TimerState.paused);
      controller.dispose();
    });

    test('reset dile shurur obosthay fire ashe', () {
      final controller = EasyTimeContoler();
      controller.setDuration(second: 10, isCountDown: true);
      controller.start();
      controller.reset();

      expect(controller.curentSecond, 10);
      expect(controller.state, TimerState.initial);
      controller.dispose();
    });
  });

  group('TimeFormate', () {
    test('3661 second = 01:01:01', () {
      expect(TimeFormate.formateSecond(3661), '01:01:01');
    });

    test('60 second = 00:01:00', () {
      expect(TimeFormate.formateSecond(60), '00:01:00');
    });

    test('0 second = 00:00:00', () {
      expect(TimeFormate.formateSecond(0), '00:00:00');
    });
  });
}
