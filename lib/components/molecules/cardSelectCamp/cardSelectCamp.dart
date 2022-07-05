import 'package:flutter/material.dart';
import 'package:smart_camp/model/camp.dart';
import 'package:smart_camp/screens/private/selectPlant/selectPlant.dart';
import 'package:smart_camp/theme/colorSets.dart';

class CardSlectCamp extends StatefulWidget {
  bool isSelected;
  Camp camp;

  CardSlectCamp(
    this.camp, {
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<CardSlectCamp> createState() => _CardSlectCampState();
}

class _CardSlectCampState extends State<CardSlectCamp> {
  @override
  Widget build(BuildContext context) {
    handleDecoration() {
      if (widget.isSelected) {
        return BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: colorGreenSegundary,
        );
      }
      return BoxDecoration(
        border: Border.all(color: Colors.transparent),
      );
    }

    return ElevatedButton(
      // decoration: handleDecoration(),
      // padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.camp.getName,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SelectPlant(
                camp: widget.camp,
              );
            },
          ),
        ),
      },
    );
  }
}
