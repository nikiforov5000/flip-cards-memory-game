import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/widgets/logo_timer_start_button.dart';
import 'package:del_flip_card_game/widgets/score_progress.dart';
import 'package:del_flip_card_game/widgets/show_level.dart';
import 'package:del_flip_card_game/widgets/show_total_solved.dart';
import 'package:flutter/material.dart';

class GameProgressBloc extends StatelessWidget {
  const GameProgressBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GameController.scoresStream,
      builder: (BuildContext context, snapshot) {
        double? value;
        if (snapshot.data != null) {
          value = snapshot.data as double?;
        }
        return Column(
          children: [
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShowLevel(),
                ShowTotalSolved(),
              ],
            ),
            const LogoTimerStartButton(),
            const SizedBox(height: 10),
            ScoreProgress(value: value),
          ],
        );
      },
    );
  }
}
