import 'package:flutter/material.dart';

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
      body:
          // Image(image: AssetImage('assets/images/logo.png')),
          // Image.asset('assets/images/logo.png'),
          //   Column(
          // children: [
          //   Image.asset(Asset.logoImage),
          //   Image.network(
          //       'https://storage.googleapis.com/cms-storage-bucket/4cdf1c5482cd30174cfe.png'),
          //   FadeInImage.assetNetwork(
          //     placeholder: 'assets/images/fade_logo.png',
          //     image:
          //         'https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png',
          //   ),
          // ],
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text('back'),
            ),
            Text(widget.name),
            Text(widget.age.toString()),
          ],
        ),
      ),
    );
  }
}
