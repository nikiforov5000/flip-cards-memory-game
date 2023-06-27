import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/restart_button.dart';
import 'package:flutter/material.dart';

class ProgressFillingBox extends StatelessWidget {
  final double _maxHeight;
  final double _currentHeight;
  const ProgressFillingBox(this._maxHeight, this._currentHeight, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _maxHeight,
      height: _currentHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        backgroundBlendMode: BlendMode.saturation,
      ),
      child: GameTimer.isGameOver ? RestartButton(_currentHeight) : Container(),
    );
  }
}
