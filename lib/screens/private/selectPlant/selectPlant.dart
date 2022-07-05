import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/atoms/button/button.dart';
import 'package:smart_camp/components/molecules/cardSelectPlant/cardSelectPlant.dart';
import 'package:smart_camp/components/organism/containerGlobal/containerGlobal.dart';
import 'package:smart_camp/components/organism/taggleSelectPlant/taggleSelectPlant.dart';
import 'package:smart_camp/model/camp.dart';
import 'package:smart_camp/model/listCamp.dart';
import 'package:smart_camp/model/listPlants.dart';
import 'package:smart_camp/model/plant.dart';
import 'package:smart_camp/model/planting.dart';
import 'package:smart_camp/model/sensors.dart';
import 'package:smart_camp/screens/private/home/home.dart';

class SelectPlant extends StatefulWidget {
  Camp camp;

  SelectPlant({Key? key, required this.camp}) : super(key: key);

  @override
  _SelectPlantState createState() => _SelectPlantState();
}

class _SelectPlantState extends State<SelectPlant> {
  final inputNameCampController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String img = 'assets/img/png/emojiHappy.png';

  List<Plant> listPlants = [
    Plant('Maracujá', 'assets/img/png/maracuja.png', new DateTime(2022)),
    Plant('Maracujá roxo', 'assets/img/png/maracuja.png', new DateTime(2022)),
    Plant('Milho', 'assets/img/png/maracuja.png', new DateTime(2022)),
    Plant('Tomate', 'assets/img/png/maracuja.png', new DateTime(2022)),
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 576;

    return Scaffold(
      floatingActionButton: Container(
        width: 564,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0),
          child: ElevatedButton(
            child: Text('Cadastrar plantio'),
            onPressed: () => {
              _createPlanting(widget.camp, listPlants[0]),
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
                    'Quais plantas você deseja plantar no campo ${widget.camp.getName}?',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),

                // shrinkWrap: true,
              ],
            ),

            ListView.separated(
              itemCount: listPlants.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text('   '),
              ),
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  child: Text(listPlants[index].name),
                  onPressed: () =>
                      _createPlanting(widget.camp, listPlants[index]),
                );
              },
            ),

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

  _createPlanting(Camp camp, Plant plant) {
    Sensors sensors = Sensors(false, true, false, 0, 0, 2, 3, 7, 0);

    Planting planting = Planting(plant, sensors);

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
