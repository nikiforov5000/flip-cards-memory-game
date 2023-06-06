import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  const ProgressBar({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(5, 5),
          blurRadius: 10,
        ),
        ],
        borderRadius: BorderRadius.circular(99),
        border: Border.all(
          color: Color(0x99eeaa00),
          width: 3,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(99),
        child: SizedBox(
          height: 50,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const ProgressBackground(),
              ProgressForeground(value: value ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressForeground extends StatelessWidget {
  final double value;

  const ProgressForeground({
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double currentWidth = constraints.maxWidth * value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: currentWidth,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProgressBackground extends StatelessWidget {
  const ProgressBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x666666ff),
      ),
    );
  }
}