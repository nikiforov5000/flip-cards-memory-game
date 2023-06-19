import 'package:del_flip_card_game/constants/colors.dart';
import 'package:flutter/material.dart';

class LogoBackground extends StatelessWidget {
  const LogoBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: kToxicWhiteColor,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/images/square-logo.png')),
    );
  }
}
