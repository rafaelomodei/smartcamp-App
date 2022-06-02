import 'package:flutter/material.dart';
import 'package:smart_camp/screens/private/createCamp/createCamp.dart';
import 'package:smart_camp/screens/private/home/home.dart';
import 'package:smart_camp/screens/private/selectPlant/selectPlant.dart';
import 'package:smart_camp/screens/public/login/login.dart';
import 'package:smart_camp/screens/public/loginToken/loginToken.dart';
import 'package:smart_camp/screens/public/splashScreen/splashScreen.dart';
import 'package:smart_camp/theme/themeDefault.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeDefault(),
      home: SelectPlant(),
      debugShowCheckedModeBanner: false,
    );
  }
}
