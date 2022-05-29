import 'package:flutter/material.dart';
import 'package:smart_camp/components/button/button.dart';
import 'package:smart_camp/components/cardSelectPlant/cardSelectPlant.dart';
import 'package:smart_camp/components/containerGlobal/containerGlobal.dart';

class SelectPlant extends StatelessWidget {
  final inputNameCampController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String img = 'assets/img/png/emojiHappy.png';

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 576;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.surface,
          ),
          onPressed: () {},
        ),
        elevation: 0.0,
        // backgroundColor: Colors.transparent,
      ),
      body: ContainerGLobal(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: 500.0,
                    child: Column(
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
                            'Quais plantas você deseja plantar no campo Hortaliças?',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: isMobile ? 2 : 3,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          children: List.generate(20, (index) {
                            return CardSlectPlant();
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Button('Confirmar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _validateInputPhone({String value = ''}) {
    return value.length != 9 ? 'aasd' : '';
  }
}
