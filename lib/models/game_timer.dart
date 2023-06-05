import 'dart:async';

class GameTimer {
  static bool isRunning = false;
  static Timer? _timer;
  static int _start = 50;
  static bool gameOver = false;
  static StreamController _controller = StreamController();

  static void startTimer() {
    isRunning = true;
    const oneTenthOfSecond = const Duration(milliseconds: 100);
    _timer = Timer.periodic(
      oneTenthOfSecond,
      (Timer timer) {
        print('game_timer.dart -> timer:$_start');
        if (_start < 1) {
          _controller.add(_start);
          _timer!.cancel();
          gameOver = true;
          isRunning = false;
        }
        else {
          _controller.add(_start);
          _start -= 1;
        }
      },
    );
  }

  static Stream get timeStream => _controller.stream;

  static String string() {
    String seconds = (_start / 10).floor().toString();
    String oneTenth = (_start % 10).toString();
    return '$seconds.$oneTenth';
  }

}