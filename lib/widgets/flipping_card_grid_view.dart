import 'package:del_flip_card_game/models/card_list.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/flipping_card_widget.dart';
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
        GameTimerWidget(),
        ScoreProgress(GameController.scores),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(GameController.length, (index) {
              return FlippingCardWidget(
                onTap: () {
                  if (GameTimer.gameOver) { return; }
                  if (GameController.isNotClickable(index)) { return; }
                  if (GameController.isTappedMoreThanTwo()) { return; }
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
                              // GameController.resetPrev();
                            });
                          }
                        });
                      }
                    }
                  });
                },
                card: GameController.list[index],
              );
            }),
          ),
        ),
      ],
    );
  }

  wait() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
  }
}

class ScoreProgress extends StatelessWidget {
  double _value;
  ScoreProgress(this._value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _value,
    );
  }
}

class GameTimerWidget extends StatelessWidget {
  GameTimerWidget ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GameTimer.timeStream,
      builder: (BuildContext context, snapshot) {

        return Stack(
          children: [
            Text(GameTimer.string()),
            GameTimer.gameOver
                ? Text('Game Over!!! Your Score is ${GameController.solved.toString()} / ${GameController.length.toString()}')
                : Text(''),
          ],
        );
      }
    );
  }
}



