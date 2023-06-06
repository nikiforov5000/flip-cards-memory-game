import 'package:del_flip_card_game/models/flipping_card.dart';
import 'package:flutter/material.dart';

class FlippingCardWidget extends StatelessWidget {
  final FlippingCard card;
  final VoidCallback onTap;

  const FlippingCardWidget({required this.onTap, required this.card, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: card.isFlipped ? getFace() : getBack(),
      ),
    );
  }

  Widget getFace() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        card.isMatched ? const Text('Matched') : const SizedBox(),
        Text(card.label.toString()),
      ],
    );
  }

  Widget getBack() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
          'assets/images/cards/back/back.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
