import 'package:del_flip_card_game/constants/text_styles.dart';
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
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double currentHeight = constraints.maxHeight * value;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProgressFillingBox(constraints.maxHeight, currentHeight),
                  ],
                );
              },
            ),
            TimerWidget(snapshot.data),
          ],
        );
      },
    );
  }
}

class TimerWidget extends StatelessWidget {
  final int data;
  const TimerWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      makeString(data),
      style: kProgressBarTextStyle,
    );
  }

  String makeString(int data) {
    String minutes = (data / 600).floor().toString();
    String seconds = (data % 600 / 10).floor().toString();
    String tenthsOfSecond = (data % 10).toString();
    if (minutes.length < 2) { minutes = '0$minutes'; }
    if (seconds.length < 2) { seconds = '0$seconds'; }
    if (tenthsOfSecond.length < 2) { tenthsOfSecond = '0$tenthsOfSecond'; }
    return '$minutes:$seconds.$tenthsOfSecond';
  }

}

