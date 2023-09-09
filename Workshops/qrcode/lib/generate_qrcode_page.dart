import 'package:flutter/material.dart';

class GenerateQRCodePage extends StatefulWidget {
  GenerateQRCodePage({super.key, required this.title});

  String title;

  @override
  State<GenerateQRCodePage> createState() => _GenerateQRCodePageState();
}

class _GenerateQRCodePageState extends State<GenerateQRCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: shared,
          )
        ],
      ),
    );
  }

  void shared() {}
}
