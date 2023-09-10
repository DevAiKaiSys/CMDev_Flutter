import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCodePage extends StatefulWidget {
  GenerateQRCodePage({super.key, required this.title});

  String title;

  @override
  State<GenerateQRCodePage> createState() => _GenerateQRCodePageState();
}

class _GenerateQRCodePageState extends State<GenerateQRCodePage> {
  final TextEditingController _textController = TextEditingController();

  String _dataQRCode = "";

  @override
  void initState() {
    _textController.addListener(() {
      Change();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: shared,
          )
        ],
      ),
      body: _buildContent(),
    );
  }

  void shared() {}

  _buildContent() => Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 40),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: "Enter the text to create the qe code"),
            ),
            SizedBox(height: 40),
            QrImageView(
              backgroundColor: Colors.white,
              data: _dataQRCode,
              size: 150,
            ),
          ],
        ),
      );

  Change() {
    setState(() {
      _dataQRCode = _textController.text;
    });
  }
}
