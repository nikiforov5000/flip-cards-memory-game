import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/flipping_card_widget.dart';
import 'package:del_flip_card_game/widgets/game_timer_widget.dart';
import 'package:del_flip_card_game/widgets/score_progress.dart';
import 'package:flutter/material.dart';

class FlippingCardGridView extends StatefulWidget {
  FlippingCardGridView({Key? key}) : super(key: key) {
    GameController.seedCardList();
  }

  @override
  State<FlippingCardGridView> createState() => _FlippingCardGridViewState();
}

class _FlippingCardGridViewState extends State<FlippingCardGridView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GameTimerWidget(),
        ScoreProgress(GameController.scores),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(GameController.length, (index) {
              return FlippingCardWidget(
                onTap: () {
                  tapCard(index);
                },
                card: GameController.list[index],
              );
            }),
          ),
        ),
      ],
    );
  }

  void tapCard(int index) {
    if (GameTimer.gameOver) {
      return;
    }
    if (GameController.isNotClickable(index)) {
      return;
    }
    if (GameController.isTappedMoreThanTwo()) {
      setState(() {
        GameController.flipCardsBack(index);
      });
      return;
    }
    setState(() {
      GameController.flipCard(index);
      if (GameController.noPrevCard) {
        GameController.setPrev(index);
      } else {
        if (GameController.isMatch(index)) {
          GameController.markCardsAsMatched(index);
          GameController.resetPrev();
        } else {
          wait().then((_) {
            if (mounted) {
              setState(() {
                GameController.flipCardsBack(index);
              });
            }
          });
        }
      }
    });
  }

  wait() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
  }
}
