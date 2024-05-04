import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FlutterLogo(
        style: FlutterLogoStyle.horizontal,
        size: 450,
      ),
    );
  }
}
