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

    return GestureDetector(
      onTap: onTap,
      child: card.isFlipped ? getFace() : getBack(),
    );
  }

  Widget getFace() {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          card.isMatched ? const Text('Matched') : const SizedBox(),
          Text(card.label.toString()),
        ],
      ),
    );
  }

  Widget getBack() {
    return Container(
      color: Colors.grey,
      child: Center(child: Text('${card.label}\'s back')),
    );
  }
}
