import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/progress_filling_box.dart';
import 'package:flutter/material.dart';

class ProgressAndRestartStreamBuilder extends StatelessWidget {
  const ProgressAndRestartStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GameTimer.timeStream,
      builder: (BuildContext context, snapshot) {
        double value = GameTimer.percentLeft();
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double currentHeight = constraints.maxHeight * value;
            return ProgressFillingBox(constraints.maxHeight, currentHeight);
          },
        );
      },
    );
  }
}
