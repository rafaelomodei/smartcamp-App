import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_camp/components/Text/Text.dart';
import 'package:smart_camp/components/button/button.dart';
import 'package:smart_camp/components/card/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> ItemList = [
    TextTitle('Campo 1'),
    CardItem(),
    CardItem(),
    CardItem(),
    CardItem(),
    CardItem(),
    CardItem(),
    CardItem(),
    CardItem(),
    CardItem(),
    CardItem(),
    ElevatedButton(onPressed: () {}, child: Text('asdas')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
        children: [
          Row(
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
              Image.asset('assets/img/png/avatar.png')
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(0, 48, 0, 24),
            child: Row(
              children: [
                Button('Todos os campos'),
                Button('Campo 1'),
                Button('Campo 2'),
                Button('Campo 3'),
                Button('Campo 4'),
                Button('Campo 5'),
                Button('Campo 6'),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: ItemList.length,
            itemBuilder: (context, position) {
              return ItemList[position];
            },
            separatorBuilder: (context, position) {
              return Padding(padding: const EdgeInsets.all(8.0));
            },
          ),
        ],
      ),
    );
  }
}
