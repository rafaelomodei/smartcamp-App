import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/atoms/button/button.dart';
import 'package:smart_camp/components/molecules/card/card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        // child:
        child: Container(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 13.0),
              padding: const EdgeInsets.all(8.0),
              elevation: 0.0,
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              shadowColor: Colors.transparent,
            ),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateCamp(),
                  )),
            },
            child: const Text('Criar novo campo'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        // backgroundColor: Colors.transparent,
      ),

      body: SafeArea(
        top: true,
        bottom: true,
        child: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '?? hora',
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
                            'Em qual campo voc?? deseja plantar ?',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Consumer<ListCamp>(builder: (context, listCamps, child) {
            return SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  listCamps.getListCamp.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CardSlectCamp(listCamps.getListCamp[index]),
                  ),
                ),
              ),
            );
          }),
        ]),
      ),

      // body: ContainerGLobal(
      //   ListView(
      //     children: <Widget>[
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   '?? hora',
      //                   textAlign: TextAlign.left,
      //                   style: Theme.of(context).textTheme.headline4,
      //                 ),
      //                 Text(
      //                   'de plantar!',
      //                   style: Theme.of(context).textTheme.headline3,
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      //             child: Text(
      //               'Em qual campo voc?? deseja plantar ?',
      //               textAlign: TextAlign.left,
      //               style: Theme.of(context).textTheme.bodyText1,
      //             ),
      //           ),

      //           // shrinkWrap: true,
      //         ],
      //       ),

      //       ElevatedButton(
      //         child: Text('Criar novo campo'),
      //         onPressed: () => {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (_) => CreateCamp(),
      //               )),
      //         },
      //       ),

      //       Consumer<ListCamp>(builder: (context, listCamps, child) {
      //         print(listCamps.getListCamp.toString());
      //         print('Select camp::child: ${child}');

      //         if (listCamps.getListCamp.length == 1) {
      //           return CardSlectCamp(
      //             listCamps.getListCamp[0],
      //             isSelected: true,
      //           );
      //         }

      //         if (listCamps.getListCamp.length > 1) {
      //           print('Entrando dentro do toggle');
      //           return TaggleSlectCamp(listCamps.getListCamp);
      //         }

      //         return Container();
      //       }),

      // Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 30.0),
      // )
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
      // ],
      // ],
      // ),
      // ),
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

class CustomWidget extends StatelessWidget {
  CustomWidget(this._index) {
    debugPrint('initialize: $_index');
  }

  final int _index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: (_index % 2 != 0) ? Colors.white : Colors.grey,
      child:
          Center(child: Text('index: $_index', style: TextStyle(fontSize: 40))),
    );
  }
}
