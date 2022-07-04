import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/molecules/cardSelectCamp/cardSelectCamp.dart';
import 'package:smart_camp/components/molecules/cardSelectPlant/cardSelectPlant.dart';
import 'package:smart_camp/model/camp.dart';
import 'package:smart_camp/model/listCamp.dart';
import 'package:smart_camp/model/plant.dart';
import 'package:smart_camp/theme/colorSets.dart';

class TaggleSlectCamp extends StatefulWidget {
  List<Camp> listCamp;

  TaggleSlectCamp(this.listCamp, {Key? key}) : super(key: key);

  @override
  State<TaggleSlectCamp> createState() => _TaggleSlectCampSate();
}

class _TaggleSlectCampSate extends State<TaggleSlectCamp> {
  String title = 'Maracujá';
  String image = 'assets/img/png/maracuja.png';

  List<bool> isSelected = [];

  createList() {
    for (Camp camp in widget.listCamp) {
      isSelected.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    createList();
    return ToggleButtons(
      direction: Axis.vertical,
      borderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
      color: Colors.transparent,
      fillColor: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      highlightColor: Colors.transparent,
      renderBorder: false,
      children: List<Widget>.generate(
        widget.listCamp.length,
        (int index) {
          return CardSlectCamp(
            widget.listCamp[index],
            isSelected: isSelected[index],
          );
        },
      ),
      onPressed: (int index) {
        _handleSelectCamp(index);
      },
      isSelected: isSelected,
    );
  }

  _handleSelectCamp(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < isSelected.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          isSelected[buttonIndex] = !isSelected[buttonIndex];
        } else {
          isSelected[buttonIndex] = false;
        }
      }
    });
  }
}
