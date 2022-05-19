import 'package:flutter/material.dart';
import 'package:smart_camp/components/button/button.dart';
import 'package:smart_camp/components/containerGlobal/containerGlobal.dart';
import 'package:smart_camp/components/input/input.dart';

class LoginToken extends StatefulWidget {
  @override
  _LoginTokenSatate createState() => _LoginTokenSatate();
}

class _LoginTokenSatate extends State<LoginToken> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerGLobal(
        Center(
          child: Container(
            width: 500,
            child: Column(
              children: [
                Text(
                  'Insira o codigo',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'de verificação',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Container(
                    width: 300,
                    child: Row(
                      children: List<Widget>.generate(4, (int index) {
                        return Expanded(
                          child: Input(
                            '?',
                            maxLength: 1,
                            regExp: r'[0-9]',
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Button('Entrar'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
