import 'package:flutter/material.dart';

class FlippingCard {
  bool isMatched = false;
  bool isFlipped = false;
  String imagePath;
  final int label;
  final double angle;
  final Color color;
  FlippingCard({required this.color,required this.label, required this.imagePath, required this.angle});
}