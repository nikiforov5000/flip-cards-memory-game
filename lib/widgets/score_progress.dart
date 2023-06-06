import 'package:del_flip_card_game/constants/text_styles.dart';
import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class ScoreProgress extends StatelessWidget {
  ScoreProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GameController.scoresStream,
      builder: (BuildContext context, snapshot) {
        double? value;
        if (snapshot.data != null) {
          value = snapshot.data as double?;
        }
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ProgressBar(value: value ?? 0),
            ScoreTitle(),
          ],
        );
      }
    );
  }
}

class ScoreTitle extends StatelessWidget {
  const ScoreTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ' Your Score is '
      '${GameController.solved.toString()} '
      '/ ${GameController.cardsQuantity.toString()}',
      style: kProgressBarTextStyle,
    );
  }
}