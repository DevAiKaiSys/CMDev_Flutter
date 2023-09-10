import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';

class GenerateQRCodePage extends StatefulWidget {
  GenerateQRCodePage({super.key, required this.title});

  String title;

  @override
  State<GenerateQRCodePage> createState() => _GenerateQRCodePageState();
}

class _GenerateQRCodePageState extends State<GenerateQRCodePage> {
  GlobalKey globalKey = GlobalKey();

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

  Future<void> shared() async {
    // final channel = MethodChannel('cm.share/share');
    // channel.invokeMethod('shareFile', 'image.png');
    try {
      RenderRepaintBoundary? boundary = globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      var image = await boundary!.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes!);

      final channel = MethodChannel('cm.share/share');
      channel.invokeMethod('shareFile', 'image.png');
    } catch (e) {
      print(e.toString());
    }
  }

  _buildContent() => Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 40),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: 'Enter the text to create the qe code'),
            ),
            SizedBox(height: 40),
            RepaintBoundary(
              key: globalKey,
              child: QrImageView(
                backgroundColor: Colors.white,
                data: _dataQRCode,
                size: 150,
              ),
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
