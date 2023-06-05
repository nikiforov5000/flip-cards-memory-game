import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/widgets/cards_grid.dart';
import 'package:del_flip_card_game/widgets/game_timer_widget.dart';
import 'package:del_flip_card_game/widgets/score_progress.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key) {
    GameController.seedCardList();
  }

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height / 5,
        ),
        Container(
          color: Colors.green,
          height: height / 10,
          child: const GameTimerWidget(),
        ),
        Container(
          color: Colors.yellow,
          height: height / 10,
          child: ScoreProgress(
            GameController.scores,
          ),
        ),
        Expanded(
          child: CardsGrid(),
        ),
      ],
    );
  }
}
