import 'package:del_flip_card_game/models/flipping_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(3, 3),
                  blurRadius: 5),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: card.isFlipped ? getFace() : getBack(),
            ),
          ),
        ),
      ),
    );
  }

  Widget getFace() {
    return Image.asset(
      card.imagePath,
      fit: BoxFit.fitWidth,
    );
  }

  Widget getBack() {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.greenAccent.withOpacity(0.4), BlendMode.screen),
      child: Image.asset(
        'assets/images/cards/back/back.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }


}
