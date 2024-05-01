import 'package:flutter/material.dart';

class MyColumnWidget extends StatelessWidget {
  const MyColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('We move under cover and we move as one'),
        Text('Through the night, we have one shot to live another day'),
        // const Text('We cannot let a stray gunshot give us away'),
        // const Text('We will fight up close, seize the moment and stay in it'),
        // const Text('It’s either that or meet the business end of a bayonet'),
        // const Text('The code word is ‘Rochambeau,’ dig me?'),
        // Text('Rochambeau!',
        //     style:
        //         DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
      ],
    );
  }
}
