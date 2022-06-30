import 'package:flutter/material.dart';

class Plant extends ChangeNotifier {
  String name;

  Plant(this.name);

  void createPlant(String name) {
    print('Plant::name: ' + name);
    this.name = name;

    notifyListeners();
  }

  @override
  String toString() {
    return name;
  }
}
