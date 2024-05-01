import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text.rich(
          TextSpan(
            text: 'Hello', // default text style
            children: <TextSpan>[
              TextSpan(
                  text: ' beautiful ',
                  style: TextStyle(fontStyle: FontStyle.italic)),
              TextSpan(
                  text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ' of Flutter',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
            ],
          ),
        ),
        Text(
          'Hello beautiful world of Flutter',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 20),
        ),
      ],
    );
  }
}
