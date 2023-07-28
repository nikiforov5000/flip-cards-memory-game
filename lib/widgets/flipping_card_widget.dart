import 'dart:math';

import 'package:del_flip_card_game/models/flipping_card.dart';
import 'package:flutter/material.dart';

class FlippingCardWidget extends StatelessWidget {
  final FlippingCard card;
  final VoidCallback onTap;
  double? sideLength;

  FlippingCardWidget({required this.onTap, required this.card, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.rotate(
        angle: card.angle,
        child: LayoutBuilder(
          builder: (BuildContext context, constraints) {
            getSideLength(constraints);
            print(sideLength);
            return Container(
              height: sideLength,
              width: sideLength,
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
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
            );
          },
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
    return ColorFiltered(
      colorFilter: ColorFilter.mode(card.color, BlendMode.overlay),
      child: Image.asset(
        'assets/images/cards/back/back.png',
        fit: BoxFit.cover,
      ),
    );
  }

  getSideLength(BoxConstraints constraints) {
    sideLength = min(constraints.maxWidth, constraints.maxHeight) - 32;
    return sideLength;
  }
}
