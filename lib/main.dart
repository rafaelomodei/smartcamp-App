import 'package:flutter/material.dart';
import 'package:smart_camp/screens/private/createCamp/createCamp.dart';
import 'package:smart_camp/screens/private/home/home.dart';
import 'package:smart_camp/screens/private/selectPlant/selectPlant.dart';
import 'package:smart_camp/screens/public/login/login.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromARGB(255, 54, 244, 12),
        brightness: Brightness.light,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
