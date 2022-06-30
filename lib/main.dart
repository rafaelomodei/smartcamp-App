import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/model/listPlants.dart';
import 'package:smart_camp/model/plant.dart';
import 'package:smart_camp/screens/private/home/home.dart';
import 'package:smart_camp/theme/themeDefault.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Plant('Milho'),
      ),
      ChangeNotifierProvider(
        create: (context) => ListPlant(),
      )
    ],
    child: SmartCamp(),
  ));
}

class SmartCamp extends StatelessWidget {
  const SmartCamp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeDefault(),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
