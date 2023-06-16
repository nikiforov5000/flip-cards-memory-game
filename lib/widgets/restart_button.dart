import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final double _currentHeight;
  const RestartButton(this._currentHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GameController.restart();
      },
      child: Container(
        color: Colors.red.withOpacity(.8),
        child: Icon(
          Icons.restart_alt,
          size: _currentHeight,
          color: Colors.yellow.withOpacity(.8),
        ),
      ),
    );
  }
}
