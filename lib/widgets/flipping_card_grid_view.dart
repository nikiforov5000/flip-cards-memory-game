import 'package:del_flip_card_game/models/card_list.dart';
import 'package:del_flip_card_game/widgets/flipping_card_widget.dart';
import 'package:flutter/material.dart';

class FlippingCardGridView extends StatefulWidget {
  FlippingCardGridView({Key? key}) : super(key: key);

  @override
  State<FlippingCardGridView> createState() => _FlippingCardGridViewState();
}

class _FlippingCardGridViewState extends State<FlippingCardGridView> {
  CardList cardList = CardList();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(cardList.length, (index) {
        return FlippingCardWidget(
          onTap: () {
            if (cardList.isNotClickable(index)) {
              return;
            }
            setState(() {
              cardList.flipCard(index);
              if (cardList.noPrevCard) {
                cardList.setPrev(index);
              } else {
                if (cardList.isMatch(index)) {
                  print('match');
                  cardList.markCardsAsMatched(index);
                  cardList.resetPrev();
                } else {
                  print('no match');
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
    );
  }

  wait() async {
    print('wait');
    await Future.delayed(const Duration(seconds: 1));
  }
}
