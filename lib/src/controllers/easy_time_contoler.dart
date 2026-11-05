import 'dart:async';

import 'package:easy_timer/easy_timer.dart';
import 'package:flutter/cupertino.dart';

class EasyTimeContoler extends ChangeNotifier {
  Timer? _timer;
  int _curentSecond = 0;
  int _initialSecond = 0;
  int _targetSecond = 0;
  TimerState _state = TimerState.initial;
  bool _isCountDown = true;
  int get curentSecond => _curentSecond;
  TimerState get state => _state;
  int get hours => _curentSecond ~/ 3600;
  int get minutes => (_curentSecond % 3600) ~/ 60;
  int get seconds => _curentSecond % 60;

  String get formateMinSec {
    final m = minutes.toString().padLeft(2, '0');
    final s = seconds.toString().padLeft(2, '0');
    return '$m:$s';
  }

  String get formatedTime => TimeFormate.formateSecond(_curentSecond);

  void setDuration({required int second, required bool isCountDown}) {
    _timer?.cancel();
    _initialSecond = second;
    _targetSecond = second;
    _curentSecond = isCountDown ? second : 0;
    _isCountDown = isCountDown;
    _state = TimerState.initial;
    notifyListeners();
  }

  String saveTime() {
    return hours > 0 ? formatedTime : formateMinSec;
  }

  void start() {
    if (_state == TimerState.runing) return;
    _timer?.cancel();
    _state = TimerState.runing;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isCountDown) {
        // Count DOWN
        _curentSecond--;
        if (_curentSecond <= 0) {
          _curentSecond = 0;
          timer.cancel();
          _state = TimerState.completed;
        }
      } else {
        // Count UP
        _curentSecond++;
        if (_targetSecond > 0 && _curentSecond >= _targetSecond) {
          _curentSecond = _targetSecond;
          timer.cancel();
          _state = TimerState.completed;
        }
      }
      notifyListeners();
    });
  }

  void pause() {
    if (_state != TimerState.runing) return;
    _timer?.cancel();
    _state = TimerState.paused;
    notifyListeners();
  }

  void reset() {
    _timer?.cancel();
    _curentSecond = _isCountDown ? _initialSecond : 0;
    _state = TimerState.initial;
    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    _state = TimerState.initial;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
