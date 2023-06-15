import 'package:del_flip_card_game/constants/text_styles.dart';
import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/cards_grid.dart';
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
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            LogoTimerStartButton(),
            // const GameTimerWidget(),
            SizedBox(
              height: height / 50,
            ),
            ScoreProgress(),
            SizedBox(
              height: height / 50,
            ),
            Expanded(
              child: CardsGrid(),
            ),
            SizedBox(
              height: height / 50,
            ),
            RestartButton(),
          ],
        ),
      ),
    );
  }
}

class LogoTimerStartButton extends StatelessWidget {
  const LogoTimerStartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
            color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(20)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/square-logo.png'),
            ),
          ),
          StreamBuilder(
            stream: GameTimer.timeStream,
            builder: (BuildContext context, snapshot) {
              double value = GameTimer.percentLeft();
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double currentWidth = constraints.maxWidth * value;
                  return Container(
                    width: constraints.maxWidth,
                    height: currentWidth,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      backgroundBlendMode: BlendMode.difference,
                    ),
                    child: GameTimer.gameOver
                        ? Container(
                            color: Colors.red.withOpacity(.8),
                            child: Icon(
                              Icons.restart_alt,
                              size: currentWidth,
                              color: Colors.yellow.withOpacity(.8),
                            ),
                          )
                        : Container(),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
    ;
  }
}

class TimerTitle extends StatelessWidget {
  const TimerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      GameTimer.string(),
      style: kProgressBarTextStyle,
    );
  }
}

class GameOverTitle extends StatelessWidget {
  GameOverTitle({Key? key}) : super(key: key);

  String gameOverString = 'Game Over';

  @override
  Widget build(BuildContext context) {
    return Text(
      gameOverString,
      style: kProgressBarTextStyle,
    );
  }
}
