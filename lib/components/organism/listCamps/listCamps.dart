import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/molecules/buttomCamp/buttomCamp.dart';
import 'package:smart_camp/components/molecules/card/card.dart';
import 'package:smart_camp/model/listCamp.dart';
import 'package:smart_camp/model/listPlants.dart';

class Camps extends StatelessWidget {
  const Camps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListCamp>(
      builder: (context, listCamps, child) {
        return Container(
          width: double.infinity,
          height: 40.0,
          child: ListView.separated(
            itemCount: listCamps.listCamp.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text('   '),
            ),
            itemBuilder: (BuildContext context, int index) {
              return ButtonCamp(listCamps.listCamp[index]);
            },
          ),
        );
      },
    );
  }
}
