import 'package:del_flip_card_game/constants/text_styles.dart';
import 'package:flutter/material.dart';

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

  String makeString(int sec) {
    String minutes = (sec / 60).floor().toString();
    String seconds = (sec % 60).toString();
    if (minutes.length < 2) {
      minutes = '0$minutes';
    }
    if (seconds.length < 2) {
      seconds = '0$seconds';
    }
    return '$minutes:$seconds';
  }
}
