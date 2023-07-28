import 'dart:async';

import 'package:flutter/foundation.dart';

class GameTimer {
  static bool isRunning = false;
  static Timer? _timer;
  static int _gameDuration = 60;
  static int _timeLeft = _gameDuration;
  static bool isGameOver = false;
  static final StreamController _controller = StreamController();

  static restart() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timeLeft = _gameDuration;
    isGameOver = false;
    isRunning = false;
    _controller.add(_timeLeft);
  }

  static void startTimer() {
    isRunning = true;
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) {
        if (kDebugMode) {
          print('game_timer.dart -> timer:$_timeLeft');
        }
        if (_timeLeft < 1) {
          _controller.add(_timeLeft);
          _timer!.cancel();
          isGameOver = true;
          isRunning = false;
        } else {
          _controller.add(_timeLeft);
          _timeLeft -= 1;
        }
      },
    );
  }

  static Stream get timeStream => _controller.stream;

  static String string() {
    // String seconds = (_timeLeft / 10).floor().toString();
    // String oneTenth = (_timeLeft % 10).toString();
    return 'Time left: ${_timeLeft.toString()}';
  }

  static percentLeft() {
    return (_gameDuration - _timeLeft) / _gameDuration;
  }

  static void reduceTime() {
    if (_gameDuration > 5) {
      _gameDuration -= 5;
    }
  }
}
