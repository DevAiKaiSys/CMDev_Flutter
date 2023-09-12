import 'package:flutter/material.dart';
import 'package:stock/src/constants/asset.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key, this.name = '-', this.age = 0});
  //
  // final String name;
  // final int age;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Map<Object, Object> arguments =
        (ModalRoute.of(context)?.settings.arguments) as Map<Object, Object>;
    final models = Map<String, Object>.from(arguments);

    var name = '-';
    var age = 30;
    if (models['name'] is String) {
      name = models['name'] as String;
    }
    if (models['age'] is int) {
      age = models['age'] as int;
    }

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
          // Text(widget.name),
          // Text(widget.age.toString()),
          Text(name),
          Text(age.toString()),
          Image.asset(Asset.LOGO_IMAGE),
          Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1920px-Google-flutter-logo.svg.png'),
        ],
      ),
    );
  }
}