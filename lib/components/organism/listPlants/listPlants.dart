import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/molecules/card/card.dart';
import 'package:smart_camp/model/camp.dart';
import 'package:smart_camp/model/listCamp.dart';
import 'package:smart_camp/model/listPlants.dart';

class Plants extends StatelessWidget {
  const Plants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListCamp>(
      builder: (context, listCamps, child) {
        return ListView.separated(
          itemCount: listCamps.getListCamp[0].getListPlanting.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
          ),
          itemBuilder: (BuildContext context, int index) {
            return CardItem(
                photo:
                    listCamps.getListCamp[0].getListPlanting[index].plant.photo,
                name:
                    listCamps.getListCamp[0].getListPlanting[index].plant.name);
          },
        );
      },
    );
  }
}
