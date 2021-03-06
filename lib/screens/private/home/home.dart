import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/molecules/buttomCamp/buttomCamp.dart';
import 'package:smart_camp/components/molecules/card/card.dart';
import 'package:smart_camp/components/organism/listCamps/listCamps.dart';
import 'package:smart_camp/components/organism/listPlants/listPlants.dart';
import 'package:smart_camp/model/listCamp.dart';
import 'package:smart_camp/screens/private/selectCamp/selectCamp.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hasPant = false;

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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SelectCamp();
              }));
            },
            child: const Text('Adicionar novo plantio'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 48.0),
                  child: const Header(),
                ),
                // Camps(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 24.0),
                  child: Text(
                    'Hortali??as ${hasPant}',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ),
          Consumer<ListCamp>(builder: (context, listCamp, child) {
            return listCamp.getListCamp.isNotEmpty
                ? SliverList(
                    delegate: SliverChildListDelegate(
                      List.generate(
                        listCamp.getListCamp[0].getListPlanting.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: CardItem(
                            photo: listCamp.getListCamp[0]
                                .getListPlanting[index].plant.photo,
                            name: listCamp.getListCamp[0].getListPlanting[index]
                                .plant.name,
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Voc?? n??o tem nenhum plantio no momento',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  );
          }),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 100,
              ),
            ]),
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
              '28?? C',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
