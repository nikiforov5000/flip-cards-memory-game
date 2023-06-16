import 'package:del_flip_card_game/widgets/logo_background.dart';
import 'package:del_flip_card_game/widgets/progress_and_restart_stream_builder.dart';
import 'package:flutter/material.dart';

class LogoTimerStartButton extends StatelessWidget {
  const LogoTimerStartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: const SizedBox(
        height: 200,
        width: 200,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            LogoBackground(),
            ProgressAndRestartStreamBuilder(),
          ],
        ),
      ),
    );
  }
}
