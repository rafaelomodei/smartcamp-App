import 'package:flutter/material.dart';
import 'package:smart_camp/components/button/button.dart';
import 'package:smart_camp/components/containerGlobal/containerGlobal.dart';
import 'package:flutter/services.dart';

class CreatedCamp extends StatelessWidget {
  final inputNameCampController = TextEditingController();

  String img = 'assets/img/png/emojiHappy.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerGLobal(
        Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Image.asset(img, scale: 3),
                        ),
                        Text(
                          'Prontinho',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          ' Seu plantio foi adicionado com sucesso!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Button('Confirmar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
