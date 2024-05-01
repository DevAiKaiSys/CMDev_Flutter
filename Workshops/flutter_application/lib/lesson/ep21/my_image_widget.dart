import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage('assets/images/cat.jpeg'));
    // return FadeInImage.assetNetwork(
    //   placeholder: 'assets/images/cat.jpeg',
    //   image: 'https://picsum.photos/250?image=9',
    // );
  }
}
