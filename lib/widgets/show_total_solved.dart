import 'package:del_flip_card_game/constants/text_styles.dart';
import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class ShowTotalSolved extends StatelessWidget {
  const ShowTotalSolved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Total solved ${GameController.totalSolved}', style: kProgressBarTextStyle,);
  }
}