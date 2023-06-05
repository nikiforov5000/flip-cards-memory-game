import 'package:del_flip_card_game/models/flipping_card.dart';
import 'package:flutter/material.dart';

class FlippingCardWidget extends StatelessWidget {
  final FlippingCard card;
  final VoidCallback onTap;

  const FlippingCardWidget({required this.onTap, required this.card, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.yellow,
      margin: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: card.isFlipped ? getFace() : getBack(),
      ),
    );
  }

  Widget getFace() {
    return Column(
      children: [
        card.isMatched ? const Text('Matched') : const SizedBox(),
        Text(card.label.toString()),
      ],
    );
  }

  Text getBack() {
    return Text('${card.label}\'s back');
  }
}
