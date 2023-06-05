import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:flutter/material.dart';

class GameTimerWidget extends StatelessWidget {
  const GameTimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return StreamBuilder(
      stream: GameTimer.timeStream,
      builder: (BuildContext context, snapshot) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: height / 20,
              child: LinearProgressIndicator(
                value: GameTimer.percentLeft(),
              ),
            ),
            GameTimer.gameOver
                ? GameOverTitle()
                : Text(GameTimer.string()),
          ],
        );
      },
    );
  }
}

class GameOverTitle extends StatelessWidget {
  GameOverTitle({Key? key}) : super(key: key);

  String gameOverString = 'Game Over!!! Your Score is '
      '${GameController.solved.toString()} '
      '/ ${GameController.length.toString()}';

  @override
  Widget build(BuildContext context) {
    return Text(gameOverString);
  }
}

