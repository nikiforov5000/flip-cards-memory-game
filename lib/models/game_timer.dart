import 'dart:async';

class GameTimer {
  static Timer? _timer;
  static int _start = 30;
  static bool _gameOver = false;
  static StreamController _controller = StreamController();

  static void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start < 1) {
          _timer!.cancel();
          _gameOver = true;
          _controller.add(_start);
        }
        else {
          _start--;
        }
      },
    );
  }

  static Stream get timeStream =>  _controller.stream;

}