import 'package:flutter/material.dart';

class LogoBackground extends StatelessWidget {
  const LogoBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      // color: Colors.purpleAccent,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.greenAccent],
          stops: [0,1]
        )
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/images/square-logo.png')),
    );
  }
}
