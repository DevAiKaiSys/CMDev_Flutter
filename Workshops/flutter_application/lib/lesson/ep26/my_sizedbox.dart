import 'package:flutter/material.dart';

class MySizedBoxWidget extends StatelessWidget {
  const MySizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Card(
    //   child: Text('Hello World!'),
    // );
    return const SizedBox(
        width: 100.0,
        height: 100.0,
        child: Text('SizedBox Widget',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  }
}
