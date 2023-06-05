import 'package:del_flip_card_game/models/flipping_card.dart';
import 'package:del_flip_card_game/models/game_timer.dart';

class CardList {
  List<FlippingCard> _list = [];

  int _prev = -1;

  int length = 16;

  int solved = 0;

  CardList() {
    _seedCardList();
  }

  get scores => solved / length;

  get list => _list;

  bool get noPrevCard => _prev == -1;

  void _seedCardList() {
    for (int i = 0; i < length / 2; ++i) {
      _list.add(FlippingCard(i + 1));
      _list.add(FlippingCard(i + 1));
    }
    _list.shuffle();
  }

  void flipCard(int index) {
    if (!GameTimer.isRunning) {
      GameTimer.startTimer();
    }
    _list[index].isFlipped = true;
  }

  void setPrev(int index) {
    _prev = index;
  }

  bool isMatch(int index) {
    return _list[index].label == _list[_prev].label;
  }

  void resetPrev() {
    _prev = -1;
  }

  void markCardsAsMatched(int index) {
    solved += 2;
    _list[index].isMatched = true;
    _list[_prev].isMatched = true;
  }

  void flipCardsBack(int index) {
    _list[index].isFlipped = false;
    _list[_prev].isFlipped = false;
    resetPrev();
  }

  bool isNotClickable(int index) {
    return index == _prev || _list[index].isFlipped || _list[index].isMatched;
  }

  bool isTappedMoreThanTwo() {
    if (_prev != -1 && flippedButNotMatched()) {
      return true;
    }
    return false;
  }

  bool flippedButNotMatched() {
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