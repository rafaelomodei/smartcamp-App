import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/atoms/button/button.dart';
import 'package:smart_camp/components/molecules/cardSelectCamp/cardSelectCamp.dart';
import 'package:smart_camp/components/molecules/cardSelectPlant/cardSelectPlant.dart';
import 'package:smart_camp/components/organism/containerGlobal/containerGlobal.dart';
import 'package:smart_camp/components/organism/taggleSelectCamp/taggleSelectCamp.dart';
import 'package:smart_camp/components/organism/taggleSelectPlant/taggleSelectPlant.dart';
import 'package:smart_camp/model/camp.dart';
import 'package:smart_camp/model/listCamp.dart';
import 'package:smart_camp/model/listPlants.dart';
import 'package:smart_camp/model/plant.dart';
import 'package:smart_camp/model/planting.dart';
import 'package:smart_camp/model/sensors.dart';
import 'package:smart_camp/screens/private/createCamp/createCamp.dart';
import 'package:smart_camp/screens/private/home/home.dart';

class SelectCamp extends StatefulWidget {
  SelectCamp({Key? key}) : super(key: key);

  @override
  _SelectCampState createState() => _SelectCampState();
}

class _SelectCampState extends State<SelectCamp> {
  final inputNameCampController = TextEditingController();

  List<Camp> listCamp = [
    Camp('Camp 1'),
    Camp('Camp 2'),
    Camp('Camp 3'),
    Camp('Camp 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 564,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0),
          child: ElevatedButton(
            child: Text('Continuar'),
            onPressed: () => {
              // _createPlanting(widget.camp),
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {},
        ),
        elevation: 0.0,
        // backgroundColor: Colors.transparent,
      ),
      body: ContainerGLobal(
        ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'É hora',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        'de plantar!',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: Text(
                    'Em qual campo você deseja plantar ?',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),

                // shrinkWrap: true,
              ],
            ),

            ElevatedButton(
              child: Text('Criar novo campo'),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreateCamp(),
                    )),
              },
            ),

            Consumer<ListCamp>(builder: (context, listCamps, child) {
              print(listCamps.listCamp.toString());
              if (listCamps.listCamp.length > 1)
                return TaggleSlectCamp(listCamps.listCamp);
              if (listCamps.listCamp.length == 1)
                return CardSlectCamp(
                  listCamps.listCamp[0],
                  isSelected: true,
                );
              return ElevatedButton(
                child: Text('Criar novo campo'),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateCamp(),
                      )),
                },
              );
            }),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
            )
            // GridView.count(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   crossAxisCount: isMobile ? 2 : 3,
            //   crossAxisSpacing: 12.0,
            //   mainAxisSpacing: 12.0,
            //   children: List.generate(20, (index) {
            //     return CardSlectPlant();
            //   }),
            // ),

            // alignment: Alignment.bottomCenter,
            // Positioned(
            //   bottom: 15.0,
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            //     child: Button('Confirmar'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  String _validateInputPhone({String value = ''}) {
    return value.length != 9 ? 'aasd' : '';
  }

  _createPlanting(Camp camp) {
    Plant plantMilho = Plant('Milho', 'photo', new DateTime(2022));
    Sensors sensors = Sensors(false, true, false, 0, 0, 2, 3, 7, 0);

    Planting planting = Planting(plantMilho, sensors);

    print(planting);
    camp.addPlant(planting);

    // Provider.of<ListCamp>(context, listen: false).addPlant(plantMilho);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ));
  }
}
