import 'dart:collection';
import 'package:flutter/material.dart';
import '../cat_card.dart';

class CardsStackModel extends ChangeNotifier {
  final List<CatCardT> _cards = [];

  CardsStackModel() {
    for (int i = 0; i < 10; i++) {
      _cards.add(CatCardT());
    }
  }

  UnmodifiableListView<CatCardT> get cards => UnmodifiableListView(_cards);

  int get length => _cards.length;

  void add() {
    _cards.add(CatCardT());
    notifyListeners();
  }

  void removeFirst() {
    if (_cards.isNotEmpty) {
      _cards.removeAt(0);
    }

    notifyListeners();
  }
}