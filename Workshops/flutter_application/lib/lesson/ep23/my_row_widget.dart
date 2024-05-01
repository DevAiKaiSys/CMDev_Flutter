import 'package:flutter/material.dart';

class MyRowWidget extends StatelessWidget {
  const MyRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Deliver features faster', textAlign: TextAlign.center),
        Text('Craft beautiful UIs', textAlign: TextAlign.center)
      ],
    );
  }
}
