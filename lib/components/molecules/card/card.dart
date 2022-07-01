import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/model/plant.dart';

class CardItem extends StatelessWidget {
  String title = 'Maracujá';
  String image = 'assets/img/png/maracuja.png';

  final Plant plant;

  CardItem(this.plant);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(245, 250, 247, 1.0),
                Color.fromRGBO(240, 240, 240, 1)
              ])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Image.asset(
              image,
              // fit: BoxFit.fitWidth,
            ),
          ),
          Text(plant.toString()),
        ],
      ),
    );
  }
}
