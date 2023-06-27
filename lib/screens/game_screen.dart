import 'package:del_flip_card_game/controllers/game_controller.dart';
import 'package:del_flip_card_game/widgets/cards_grid.dart';
import 'package:del_flip_card_game/widgets/game_progress_block.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key) {
    GameController.seedCardList();
  }

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            const GameProgressBloc(),
            SizedBox(
              height: height / 50,
            ),
            const Expanded(
              child: CardsGrid(),
            ),
            SizedBox(
              height: height / 50,
            ),
          ],
        ),
      ),
    );
  }
}
