import 'package:flutter/material.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.screen),
          image: AssetImage(
            'assets/images/logo.png',
          ),
        )
      ),
    );
  }
}
