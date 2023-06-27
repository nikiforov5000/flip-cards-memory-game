import 'package:del_flip_card_game/constants/colors.dart';
import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/widgets/cards_grid.dart';
import 'package:del_flip_card_game/widgets/logo_timer_start_button.dart';
import 'package:del_flip_card_game/widgets/progress_bar.dart';
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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
            GameProgressBloc(),

            SizedBox(
              height: height / 50,
            ),
            const Expanded(
              child: CardsGrid(),
            ),
            SizedBox(
              height: height / 50,
            ),
          ],
        ),
      ),
    );
  }
}

class GameProgressBloc extends StatelessWidget {
  const GameProgressBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: height / 50,
        ),
        StreamBuilder(
            stream: GameController.scoresStream,
            builder: (BuildContext context, snapshot) {
              double? value;
              if (snapshot.data != null) {
                value = snapshot.data as double?;
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Level ${GameController.level}'),
                      Text('Total solved ${GameController.totalSolved}'),
                    ],
                  ),
                      const LogoTimerStartButton(),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ProgressBar(value: value ?? 0),
                      ScoreTitle(),
                    ],
                  ),
                ],
              );
            }
        ),
      ],
    );
  }
}

