import 'package:del_flip_card_game/constants/text_styles.dart';
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
        )),
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

    return StreamBuilder(
      stream: GameController.scoresStream,
      builder: (BuildContext context, snapshot) {
        double? value;
        if (snapshot.data != null) {
          value = snapshot.data as double?;
        }
        return Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShowLevel(),
                ShowTotalSolved(),
              ],
            ),
            const LogoTimerStartButton(),
            ScoreProgress(value: value),
          ],
        );
      },
    );
  }
}

class ScoreProgress extends StatelessWidget {
  const ScoreProgress({
    super.key,
    required this.value,
  });

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ProgressBar(value: value ?? 0),
        ScoreTitle(),
      ],
    );
  }
}

class ShowTotalSolved extends StatelessWidget {
  const ShowTotalSolved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Total solved ${GameController.totalSolved}', style: kProgressBarTextStyle,);
  }
}

class ShowLevel extends StatelessWidget {
  const ShowLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Level ${GameController.level}', style: kProgressBarTextStyle,);
  }
}
