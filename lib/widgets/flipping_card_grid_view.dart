import 'package:del_flip_card_game/models/card_list.dart';
import 'package:del_flip_card_game/models/game_timer.dart';
import 'package:del_flip_card_game/widgets/flipping_card_widget.dart';
import 'package:flutter/material.dart';

class FlippingCardGridView extends StatefulWidget {
  const FlippingCardGridView({Key? key}) : super(key: key);

  @override
  State<FlippingCardGridView> createState() => _FlippingCardGridViewState();
}

class _FlippingCardGridViewState extends State<FlippingCardGridView> {
  CardList cardList = CardList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GameTimerWidget(),
        ScoreProgress(cardList.scores),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(cardList.length, (index) {
              return FlippingCardWidget(
                onTap: () {
                  if (cardList.isNotClickable(index)) { return; }
                  if (cardList.isTappedMoreThanTwo()) { return; }
                  setState(() {
                    cardList.flipCard(index);
                    if (cardList.noPrevCard) {
                      cardList.setPrev(index);
                    } else {
                      if (cardList.isMatch(index)) {
                        cardList.markCardsAsMatched(index);
                        cardList.resetPrev();
                      } else {
                        wait().then((_) {
                          if (mounted) {
                            setState(() {
                              cardList.flipCardsBack(index);
                              // cardList.resetPrev();
                            });
                          }
                        });
                      }
                    }
                  });
                },
                card: cardList.list[index],
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
        return Text(GameTimer.string());
      }
    );
  }
}



