import 'package:flutter/material.dart';
import 'package:smart_camp/theme/colorSets.dart';

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0.0),
      backgroundColor: MaterialStateProperty.all(
        colorGreenPrimary,
      ),
    ),
  );
}
