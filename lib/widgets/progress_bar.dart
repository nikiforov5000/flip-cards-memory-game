import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  const ProgressBar({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ProgressBackground(h: height),
            ProgressForeground(height: height, value: value ?? 0),
            // PercentNumber(value),
          ],
        ),
      ),
    );
  }
}

class ProgressForeground extends StatelessWidget {
  final double height;
  final double value;

  const ProgressForeground({
    required this.height,
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
              height: height,
              width: currentWidth,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(99)),
            ),
          ],
        );
      },
    );
  }
}

class ProgressBackground extends StatelessWidget {
  final double h;

  const ProgressBackground({
    required this.h,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      decoration: BoxDecoration(
        color: const Color(0xff5B5A60),
        borderRadius: BorderRadius.circular(99),
      ),
    );
  }
}
