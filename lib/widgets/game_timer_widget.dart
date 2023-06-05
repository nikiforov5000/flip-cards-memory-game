import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:flutter/material.dart';

class GameTimerWidget extends StatelessWidget {
  const GameTimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GameTimer.timeStream,
      builder: (BuildContext context, snapshot) {
        return Column(
          children: [
            LinearProgressIndicator(value: GameTimer.percentLeft(),),
            Text(GameTimer.string()),
            GameTimer.gameOver
                ? Text('Game Over!!! Your Score is '
                    '${GameController.solved.toString()} '
                    '/ ${GameController.length.toString()}')
                : const Text(''),
          ],
        );
      },
    );
  }
}
