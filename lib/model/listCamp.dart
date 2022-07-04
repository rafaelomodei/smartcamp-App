import 'package:flutter/material.dart';
import 'package:smart_camp/model/camp.dart';

class ListCamp extends ChangeNotifier {
  final List<Camp> _listCamp = [];

  List<Camp> get listCamp => _listCamp;

  void addCamp(Camp camp) {
    _listCamp.add(camp);

    notifyListeners();
  }

  @override
  String toString() {
    return listCamp.toString();
  }
}
