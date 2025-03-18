import 'package:catinder/tools/cards_stack_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cat_card.dart';
import 'tools/reaction_button.dart';

class CatContainerSecond extends StatefulWidget {

  const CatContainerSecond({super.key});

  @override
  State<StatefulWidget> createState() => _CatContainerSecondState();

}

class _CatContainerSecondState extends State<CatContainerSecond> {

  int _counter = 0;
  bool _hasProvider = false;
  late CardsStackModel provider;

  @override
  Widget build(BuildContext context) {
    if (!_hasProvider) {
      provider = Provider.of<CardsStackModel>(context, listen: true);
      _hasProvider = true;
    }

    return Column(
      children: [
        Flexible(
          child: _getStack()
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            ReactionButton(
                onPressed: _handleDislike,
                icon: Image.asset("assets/icons/dislike.png"),
                color: Colors.red),
            const SizedBox(width: 40),
            ReactionButton(
                onPressed: _handleLike,
                icon: Image.asset("assets/icons/like.png"),
                color: Colors.green)
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "Total likes: $_counter",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  void addCard() {
    provider.add();
  }

  Widget packCard(CatCardT card) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.startToEnd) {
            _increaseCounter();
            provider.add();
          }
          else if (direction == DismissDirection.endToStart) {
            provider.add();
          }
          provider.removeFirst();
        },
        child: card
    );
  }

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _handleLike() {
    _increaseCounter();
    provider.removeFirst();
    provider.add();
  }

  void _handleDislike() {
    provider.removeFirst();
    provider.add();
  }

  Widget _getStack() {
    List<Widget> cards = [];

    for (var card in provider.cards) {
      cards.add(packCard(card));
    }

    return Builder(
      builder: (context) {
        return Stack(
          children: cards,
        );
      },
    );
  }
}