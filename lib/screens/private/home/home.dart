import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/molecules/card/card.dart';
import 'package:smart_camp/components/organism/listPlants/listPlants.dart';
import 'package:smart_camp/model/listPlants.dart';
import 'package:smart_camp/model/plant.dart';
import 'package:smart_camp/screens/private/createCamp/createCamp.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Plant> itemList = [
    Plant('Manga'),
    Plant('Morango'),
    Plant('Alface'),
    Plant('Mandioca'),
    // ElevatedButton(onPressed: () {}, child: Text('asdas')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          // child: Padding(
          // padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CreateCamp();
                }));
              },
              child: const Text('Adicionar novo plantio'))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 48.0),
            child: Header(),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            child: ListView.separated(
              itemCount: 25,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(
                padding: EdgeInsets.all(8),
              ),
              itemBuilder: (BuildContext context, int index) {
                return ButtonCamp();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(32.0, 32.0, 0, 24.0),
            child: Text(
              'Hortaliças',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Plants(),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meus',
              style: const TextStyle(
                fontSize: 32.0,
              ),
            ),
            const Text(
              'Plantios',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 32.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 48,
              child: Image.asset('assets/img/png/climaTempoNuvemSol.png'),
            ),
            Text(
              '28º C',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}

class ButtonCamp extends StatelessWidget {
  const ButtonCamp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 13.0),
        padding: const EdgeInsets.all(8.0),
        elevation: 0.0,
        primary: Theme.of(context).colorScheme.primary,
        onPrimary: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        shadowColor: Colors.transparent,
      ),
      onPressed: () {},
      child: const Text('Enabled'),
    );
  }
}
