import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_camp/components/organism/containerGlobal/containerGlobal.dart';
import 'package:smart_camp/model/camp.dart';
import 'package:smart_camp/model/listCamp.dart';
import 'package:smart_camp/screens/private/selectPlant/selectPlant.dart';

class CreateCamp extends StatelessWidget {
  final inputNameCampController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String img = 'assets/img/png/emojiHappy.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        child: ElevatedButton(
                            onPressed: () => _createCamp(context),
                            child: const Text('Confirmar')),
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

  _createCamp(context) {
    final String name = inputNameCampController.text;

    if (_validateInputName(name) != null) {
      final Camp newCamp = Camp(name);
      _uptdateListCamp(context, newCamp);
      Navigator.pop(context);

      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (_) => SelectPlant(camp: Camp(name)),
      //       ));
    }
  }

  _validateInputName(value) {
    return value != null ? value : null;
  }

  _uptdateListCamp(context, Camp camp) {
    print('Criando um novo campo \n\n');

    Provider.of<ListCamp>(context, listen: false).addCamp(camp);
  }
}
