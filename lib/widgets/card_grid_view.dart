import 'package:del_flip_card_game/models/card.dart';
import 'package:del_flip_card_game/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class CardGridView extends StatefulWidget {
  CardGridView({Key? key}) : super(key: key);

  @override
  State<CardGridView> createState() => _CardGridViewState();
}

class _CardGridViewState extends State<CardGridView> {

  List<FlippingCard> list = [];
  @override
  void initState() {
    seedCardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: list.map((card) {
        return FlippingCardWidget(
          onTap: () {},
          card: card,
        );
      }).toList(),
    );
  }

  void seedCardList() {
    for (int i = 0; i < 8; ++i) {
      list.add(FlippingCard(i + 1));
      list.add(FlippingCard(i + 1));
    }
    list.shuffle();
  }
}
