import 'package:del_flip_card_game/constants/text_styles.dart';
import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class ShowLevel extends StatelessWidget {
  const ShowLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Level ${GameController.level}', style: kProgressBarTextStyle,);
  }
}
