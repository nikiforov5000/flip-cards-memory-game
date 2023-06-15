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
      child: Transform.rotate(
        angle: card.angle,
        child: Container(
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(3, 3),
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: card.isFlipped ? getFace() : getBack()),
        ),
      ),
    );
  }

  Widget getFace() {
    return Image.asset(
      card.imagePath,
      fit: BoxFit.cover,
    );
  }

  Widget getBack() {
    return Image.asset(
      'assets/images/cards/back/back.png',
      fit: BoxFit.cover,
    );
  }
}
