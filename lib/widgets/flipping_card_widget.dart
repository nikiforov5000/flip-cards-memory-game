import 'package:flutter/material.dart';
import 'package:del_flip_card_game/models/flipping_card.dart';

class FlippingCardWidget extends StatelessWidget {
  final FlippingCard card;
  final VoidCallback onTap;
  const FlippingCardWidget({required this.onTap,required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          child: card.isFlipped
              ? getFace()
              : getBack(),
        ),
      ),
    );
  }

  Text getFace() {
    return Text(card.label.toString());
  }

  Text getBack() {
    return Text('back');
  }
}
