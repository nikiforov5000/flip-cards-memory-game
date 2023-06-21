import 'package:del_flip_card_game/constants/colors.dart';
import 'package:flutter/material.dart';

TextStyle kProgressBarTextStyle = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.w900,
  color: pickRandomToxicColor(),
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.5),
        offset: Offset(2, 2),
        blurRadius: 0,
      ),
      Shadow(
        color: pickRandomToxicColor(),
        offset: Offset(-2, -2),
        blurRadius: 0,
      ),
    ]);