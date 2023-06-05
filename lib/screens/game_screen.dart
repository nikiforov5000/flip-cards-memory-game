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
          height: height / 15,
        ),
        GameTitle(),
        SizedBox(
          height: height / 15,
        ),
        Container(
          color: Colors.green,
          child: const GameTimerWidget(),
        ),
        SizedBox(
          height: height / 15,
        ),
        Container(
          color: Colors.yellow,
          child: ScoreProgress(),
        ),
        SizedBox(
          height: height / 15,
        ),
        Expanded(
          child: Container(
            color: Colors.pinkAccent,
            child: CardsGrid(),
          ),
        ),
        RestartButton(),
        SizedBox(
          height: height / 15,
        ),
      ],
    );
  }
}

class RestartButton extends StatefulWidget {
  const RestartButton({Key? key}) : super(key: key);

  @override
  State<RestartButton> createState() => _RestartButtonState();
}

class _RestartButtonState extends State<RestartButton> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          GameController.restart();
        });
      },
      child: Container(
        height: height / 20,
        color: Colors.purpleAccent,
        child: Center(child: Text('Restart')),
      ),
    );
  }
}


class GameTitle extends StatelessWidget {
  const GameTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Memory Game');
  }
}

