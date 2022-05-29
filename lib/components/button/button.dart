import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String label = '';
  // Color color = const Color.fromRGBO(240, 240, 240, 1.0);

  Button(this.label, {Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 13.0),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(8.0)),
          elevation: MaterialStateProperty.all(0.0),
          // backgroundColor:
          // MaterialStateProperty.all(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
