import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'cat.dart';
import 'cat_api.dart';

class CatProvider {

  static final List<Cat> _cats = [];
  static int _lastGivenIndex = 0;

  CatProvider() {
    for (int i = 0; i < 10; i++) {
      addCat();
    }
  }

  static int getIndex() {
    addCat();
    return _lastGivenIndex++;
  }

  static Image getImageByIndex(int index) {
    if (index < _cats.length && _cats[index] is! EmptyCat) {
      return Image.network(_cats[index].imageUrl);
    }
    else {
      return Image.asset("assets/sad-cat.jpg");
    }
  }

  static BreedsInfo getBreedsInfoByIndex(int index) {
    if (index < _cats.length && _cats[index] is! EmptyCat) {
      return _cats[index].breedsInfo;
    }
    else {
      return EmptyBreedsInfo();
    }
  }

  static void addCat() {
    _tryGetCatFromApi().then((Cat result) => {
      _cats.add(result)
    },
    onError: (error) => {
      _cats.add(EmptyCat())
    });
  }

  static Future<Cat> _tryGetCatFromApi() async {
    try {
      var response = await Dio().get(CatApi.request);

      if (response.statusCode == 200 && response.data != null) {
        return Cat.fromJson(response.data[0]);
      }
      else {
        return Future.error("Connection failed");
      }
    } catch (e) {
      return Future.error("Connection error");
    }
  }
}