import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class ScoreProgress extends StatelessWidget {
  ScoreProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: GameController.scoresStream,
      builder: (BuildContext context, snapshot) {
        double? value;
        if (snapshot.data != null) {
          value = snapshot.data as double?;
        }
        return SizedBox(
          height: height / 20,
          child: LinearProgressIndicator(
            value: value ?? 0,
          ),
        );
      }
    );
  }
}
