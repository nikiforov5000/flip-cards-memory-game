import 'dart:math';

import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/flipping_card_widget.dart';
import 'package:flutter/material.dart';

class CardsGrid extends StatefulWidget {
  const CardsGrid({Key? key}) : super(key: key);

  @override
  State<CardsGrid> createState() => _CardsGridState();
}

class _CardsGridState extends State<CardsGrid> {
  @override
  Widget build(BuildContext context) {
    double side = sqrt(GameController.cardsQuantity);
    final List<Widget> col = [];

    for (int i = 0; i < side; ++i) {
      final List<Widget> row = [];
      for (int j = 0; j < side; ++j) {
        int index = (i * side + j).toInt();
        row.add(FlippingCardWidget(onTap: () {
          tapCard(index);
        },
        card: GameController.list[index],),);
      }
      col.add(
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row,
          ),
        ),
      );
    }

    return Column(
      children: col,
    );
  }

  void tapCard(int index) {
    if (GameTimer.isGameOver) {
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
