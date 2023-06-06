import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/cards_grid.dart';
import 'package:del_flip_card_game/widgets/game_timer_widget.dart';
import 'package:del_flip_card_game/widgets/game_title.dart';
import 'package:del_flip_card_game/widgets/restart_button.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)
      ),
      child:           Column(
        children: [
          SizedBox(
            height: height / 4.5,
          ),
          const GameTimerWidget(),
          SizedBox(
            height: height / 50,
          ),
          ScoreProgress(),
          SizedBox(
            height: height / 50,
          ),
          Expanded(
            child: Container(
              child: CardsGrid(),
            ),
          ),
          SizedBox(
            height: height / 50,
          ),
          RestartButton(),
          SizedBox(
            height: height / 50,
          ),
        ],
      ),
    );
  }
}





