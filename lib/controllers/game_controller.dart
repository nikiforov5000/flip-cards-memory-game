import 'package:del_flip_card_game/models/flipping_card.dart';
import 'package:del_flip_card_game/models/game_timer.dart';

class GameController {
  static final List<FlippingCard> _list = [];

  static int _prev = -1;

  static int length = 16;

  static int solved = 0;

  static get scores => solved / length;

  static get list => _list;

  static bool get noPrevCard => _prev == -1;

  static void seedCardList() {
    _list.clear();
    for (int i = 0; i < length / 2; ++i) {
      _list.add(FlippingCard(i + 1));
      _list.add(FlippingCard(i + 1));
    }
    _list.shuffle();
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
