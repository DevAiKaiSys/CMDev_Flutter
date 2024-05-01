import 'package:flutter/material.dart';

class MyIconButtonWidget extends StatefulWidget {
  const MyIconButtonWidget({super.key});

  @override
  State<MyIconButtonWidget> createState() => _MyIconButtonWidgetState();
}

class _MyIconButtonWidgetState extends State<MyIconButtonWidget> {
  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavourite ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
        size: 24.0,
        semanticLabel: 'Text to announce in accessibility modes',
      ),
      onPressed: () {
        setState(() {
          _isFavourite = !_isFavourite;
        });
      },
    );
  }
}
