import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/molecules/card/card.dart';
import 'package:smart_camp/model/listPlants.dart';
import 'package:smart_camp/model/plant.dart';

class Plants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListPlant>(builder: (context, listPlants, child) {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listPlants.listPlant.length,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
        ),
        itemBuilder: (BuildContext context, int index) {
          return CardItem(listPlants.listPlant[index]);
        },
      );
    });
  }
}
