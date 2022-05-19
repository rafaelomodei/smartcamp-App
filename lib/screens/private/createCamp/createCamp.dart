import 'package:flutter/material.dart';
import 'package:smart_camp/components/button/button.dart';
import 'package:smart_camp/components/containerGlobal/containerGlobal.dart';
import 'package:flutter/services.dart';

class CreateCamp extends StatelessWidget {
  final inputNameCampController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String img = 'assets/img/png/emojiHappy.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerGLobal(
        ListView(
          children: <Widget>[
            Center(
              child: Container(
                width: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 40),
                      //   child: Image.asset(img),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Image.asset(img, scale: 3),
                          ),
                          Text(
                            'Criar campo',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            'Vamos preparar o campo\npara o plantio',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ]),
                      ),
                      TextFormField(
                        controller: inputNameCampController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Nome do campo',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Button('Confirmar'),
                      ),
                    ],
                  ),
                ),
              ),
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
