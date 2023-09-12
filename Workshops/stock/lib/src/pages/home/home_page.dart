import 'package:flutter/material.dart';
import 'package:stock/src/constants/asset.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.name = '-', this.age = 0});

  final String name;
  final int age;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Image.asset('assets/images/logo.png'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: Text('back'),
          ),
          Text(widget.name),
          Text(widget.age.toString()),
          Image.asset(Asset.LOGO_IMAGE),
          Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1920px-Google-flutter-logo.svg.png'),
        ],
      ),
    );
  }
}
