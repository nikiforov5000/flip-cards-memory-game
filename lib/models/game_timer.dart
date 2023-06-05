import 'dart:async';

import 'package:flutter/foundation.dart';

class GameTimer {
  static bool isRunning = false;
  static Timer? _timer;
  static int _gameDuration = 90;
  static int _timeLeft = _gameDuration;
  static bool gameOver = false;
  static final StreamController _controller = StreamController();

  static restart() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timeLeft = _gameDuration;
    gameOver = false;
    isRunning = false;
    _controller.add(_timeLeft);
  }

  static void startTimer() {
    isRunning = true;
    const oneTenthOfSecond = Duration(milliseconds: 100);
    _timer = Timer.periodic(
      oneTenthOfSecond,
      (Timer timer) {
        if (kDebugMode) {
          print('game_timer.dart -> timer:$_timeLeft');
        }
        if (_timeLeft < 1) {
          _controller.add(_timeLeft);
          _timer!.cancel();
          gameOver = true;
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
    String seconds = (_timeLeft / 10).floor().toString();
    String oneTenth = (_timeLeft % 10).toString();
    return 'Time left: $seconds.$oneTenth';
  }

  static percentLeft() {
    return (_gameDuration - _timeLeft) / _gameDuration;
  }
}
