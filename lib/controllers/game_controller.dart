import 'dart:async';
import 'dart:math';

import 'package:del_flip_card_game/constants/colors.dart';
import 'package:del_flip_card_game/models/flipping_card.dart';
import 'package:del_flip_card_game/models/front_image.dart';
import 'package:del_flip_card_game/models/game_timer.dart';

class GameController {
  static final List<FlippingCard> _list = [];

  static int _prev = -1;

  static int cardsQuantity = 16;

  static int solved = 0;

  static StreamController<double> scoreController = StreamController();

  static get scores => solved / cardsQuantity;
  static get scoresStream => scoreController.stream;

  static get list => _list;

  static bool get noPrevCard => _prev == -1;

  static restart() {
    GameTimer.restart();
    solved = 0;
    scoreController.add(scores);
    seedCardList();
    resetPrev();
  }

  static void seedCardList() {
    FrontImage frontImage = FrontImage();

    _list.clear();
    for (int i = 0; i < cardsQuantity / 2; ++i) {
      String imagePath = frontImage.getRandomFrontImage();
      _list.add(FlippingCard(
        color: pickRandomToxicColor(),
        label: i + 1,
        imagePath: imagePath,
        angle: _getRandomAngle(),
      ));
      _list.add(FlippingCard(
        color: pickRandomToxicColor(),
        label: i + 1,
        imagePath: imagePath,
        angle: _getRandomAngle(),
      ));
    }
    _list.shuffle();
  }
  static double _getRandomAngle() {
    Random random = Random();
    int degrees = (random.nextInt(3) + 2) * (random.nextBool() ? -1 : 1);
    return degrees * (pi / 180);
  }

  static void flipCard(int index) {
    if (!GameTimer.isRunning) {
      GameTimer.startTimer();
    }
    _list[index].isFlipped = true;
  }

  static void setPrev(int index) {
    _prev = index;
  }

  static bool isMatch(int index) {
    return _list[index].label == _list[_prev].label;
  }

  static void resetPrev() {
    _prev = -1;
  }

  static void markCardsAsMatched(int index) {
    solved += 2;
    scoreController.add(scores);
    _list[index].isMatched = true;
    _list[_prev].isMatched = true;
  }

  static void flipCardsBack(int index) {
    for (FlippingCard card in _list) {
      if (card.isMatched == false) {
        card.isFlipped = false;
      }
    }
    resetPrev();
  }

  static bool isNotClickable(int index) {
    return index == _prev || _list[index].isFlipped || _list[index].isMatched;
  }

  static bool isTappedMoreThanTwo() {
    if (_prev != -1 && flippedButNotMatched()) {
      return true;
    }
    return false;
  }

  static bool flippedButNotMatched() {
    int count = 0;
    for (FlippingCard card in _list) {
      if (!card.isMatched && card.isFlipped) {
        if (++count == 2) {
          return true;
        }
      }
    }
    return false;
  }
}
