import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)
      ),
      child: Column(
        children: [
          SizedBox(
            height: height / 15,
          ),
          GameTitle(),
          SizedBox(
            height: height / 15,
          ),
          const GameTimerWidget(),
          SizedBox(
            height: height / 15,
          ),
          ScoreProgress(),
          SizedBox(
            height: height / 15,
          ),
          Expanded(
            child: Container(
              child: CardsGrid(),
            ),
          ),
          RestartButton(),
          SizedBox(
            height: height / 15,
          ),
        ],
      ),
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
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF2C942),  // Start color
              Color(0xffffdd00),  // Start color
              Color(0xfffab00e),  // Start color
              Color(0xff3d2601),  // Start color
            ],
            stops: [0.0, 0.33, 0.66, 1.0],  // Defines the position of each color
          ),
          border: Border.all(
            color: Colors.brown,  // Border color
            width: 2,  // Border width
          ),
          borderRadius: BorderRadius.circular(12),  // Rounded corner radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),  // Shadow color
              spreadRadius: 5,  // Extends the shadow
              blurRadius: 7,  // Soften the shadow
              offset: Offset(0, 3),  // Position of the shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Start Game',
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.brown,
                  offset: Offset(0, 5),
                  blurRadius: 30,
                ),
              ],
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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

