import 'package:del_flip_card_game/models/flipping_card.dart';
import 'package:del_flip_card_game/widgets/flipping_card_widget.dart';
import 'package:flutter/material.dart';

class FlippingCardGridView extends StatefulWidget {
  FlippingCardGridView({Key? key}) : super(key: key);

  @override
  State<FlippingCardGridView> createState() => _FlippingCardGridViewState();
}

class _FlippingCardGridViewState extends State<FlippingCardGridView> {

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
