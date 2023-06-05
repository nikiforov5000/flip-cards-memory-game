import 'package:flutter/material.dart';

class ScoreProgress extends StatelessWidget {
  final double _value;
  const ScoreProgress(this._value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearProgressIndicator(
          value: _value,
        ),
      ],
    );
  }
}
