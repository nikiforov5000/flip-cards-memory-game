import 'package:del_flip_card_game/constants/text_styles.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class GameTimerWidget extends StatelessWidget {
  const GameTimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GameTimer.timeStream,
      builder: (BuildContext context, snapshot) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ProgressBar(value: GameTimer.percentLeft()),
            GameTimer.isGameOver ? GameOverTitle() : TimerTitle(),
          ],
        );
      },
    );
  }
}

class TimerTitle extends StatelessWidget {
  const TimerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      GameTimer.string(),
      style: kProgressBarTextStyle,
    );
  }
}

class GameOverTitle extends StatelessWidget {
  GameOverTitle({Key? key}) : super(key: key);

  String gameOverString = 'Game Over';

  @override
  Widget build(BuildContext context) {
    return Text(
      gameOverString,
      style: kProgressBarTextStyle,
    );
  }
}
