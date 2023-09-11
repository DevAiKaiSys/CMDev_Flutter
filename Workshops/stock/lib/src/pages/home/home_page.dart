import 'package:flutter/material.dart';
import 'package:stock/src/constants/asset.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Image.asset('assets/images/logo.png'),
      body: Column(
        children: [
          Image.asset(Asset.LOGO_IMAGE),
          Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1920px-Google-flutter-logo.svg.png'),
        ],
      ),
    );
  }
}
