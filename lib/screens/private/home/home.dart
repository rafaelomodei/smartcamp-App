import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/molecules/buttomCamp/buttomCamp.dart';
import 'package:smart_camp/components/molecules/card/card.dart';
import 'package:smart_camp/components/organism/listCamps/listCamps.dart';
import 'package:smart_camp/components/organism/listPlants/listPlants.dart';
import 'package:smart_camp/components/organism/taggleSelectCamp/taggleSelectExample.dart';
import 'package:smart_camp/model/listCamp.dart';
import 'package:smart_camp/model/listPlants.dart';
import 'package:smart_camp/model/plant.dart';
import 'package:smart_camp/screens/private/createCamp/createCamp.dart';
import 'package:smart_camp/screens/private/selectCamp/selectCamp.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return CreateCamp();
                // }));

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SelectCamp();
                }));
              },
              child: const Text('Adicionar novo plantio'))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 48.0),
                  child: Header(),
                ),
                // Camps(),
                Padding(
                  padding: EdgeInsets.fromLTRB(32.0, 32.0, 0, 24.0),
                  child: Text(
                    'Hortaliças',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ),

          Consumer<ListCamp>(builder: (context, listCamp, child) {
            // return SliverToBoxAdapter(child: Container());
            return listCamp.getListCamp.length > 0
                ? SliverList(
                    delegate: SliverChildListDelegate(
                      List.generate(
                        listCamp.getListCamp[0].getListPlanting.length,
                        (index) => ElevatedButton(
                          child: Text(listCamp.getListCamp[0]
                              .getListPlanting[index].plant.name),
                          onPressed: () => {},
                        ),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(child: Text('Tem nada não'));
          }),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 32.0),
          //   child: Plants(),
          // ),
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
