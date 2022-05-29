import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_camp/theme/colorSets.dart';

class CardSlectPlant extends StatelessWidget {
  String title = 'Maracujá';
  String image = 'assets/img/png/maracuja.png';
  bool _selected = false;

  CardSlectPlant({Key? key}) : super(key: key);

  final LinearGradient isSelectedBackground = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(245, 250, 247, 1.0),
        Color.fromRGBO(240, 240, 240, 1.0)
      ]);

  final LinearGradient notSelectedBackground = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [colorGreenSegundary, colorGreenSegundary]);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border: _selected
                ? Border.all(color: Theme.of(context).primaryColor, width: 4.0)
                : null,
            gradient: _selected ? notSelectedBackground : isSelectedBackground),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Image.asset(
                  image,
                  alignment: Alignment.center,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        _selected = true;
      },
    );
  }
}
