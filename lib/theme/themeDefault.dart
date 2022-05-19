import 'package:flutter/material.dart';
import 'package:smart_camp/theme/colorSets.dart';
import 'package:smart_camp/theme/elevatedButtonTheme/elevatedButtonTheme.dart';
import 'package:smart_camp/theme/inputFromFieldTheme/inputFromFieldTheme.dart';
import 'package:smart_camp/theme/textTheme.dart';

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: colorGreenPrimary, // focus
  onPrimary: Colors.white,

  secondary: colorGreenSegundary,
  onSecondary: Colors.white,

  background: colorGreenPrimary, //float action button
  onBackground: Colors.black,

  error: colorError,
  onError: Colors.white,

  surface: Colors.white, // AppBar
  onSurface: colorGreenPrimary, //icons, inputs

  brightness: Brightness.light,
);

ThemeData themeDefault() {
  return ThemeData(
    fontFamily: 'Jost',
    colorScheme: _shrineColorScheme,
    inputDecorationTheme: inputDecorationTheme(),
    textTheme: textDefault,
  );
}
