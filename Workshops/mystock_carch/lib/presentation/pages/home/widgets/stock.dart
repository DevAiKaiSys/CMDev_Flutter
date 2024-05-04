import 'package:flutter/material.dart';

class Stock extends StatelessWidget {
  const Stock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FlutterLogo(
        style: FlutterLogoStyle.stacked,
        size: 450,
      ),
    );
  }
}
