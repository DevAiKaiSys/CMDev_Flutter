import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final title = "MY QR Code";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Image.asset(
              'assets/banner.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  _buildScan(context: context),
                  SizedBox(width: 30),
                  _buildGenerator()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildScan({required BuildContext context}) => Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/ic_scan_qrcode.png",
              width: 110,
              height: 110,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text("SCAN"),
              onPressed: () {
                scanQRCode(context: context);
              },
            )
          ],
        ),
      );

  _buildGenerator() => Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/ic_generate_qrcode.png",
              width: 110,
              height: 110,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent[700],
                foregroundColor: Colors.white,
              ),
              child: Text("GENERATE"),
              onPressed: () {},
            )
          ],
        ),
      );

  Future scanQRCode({required BuildContext context}) async {
    try {
      final result = await BarcodeScanner.scan();
      final String barcode = result.rawContent;

      showAlertDialog(result: barcode, context: context);
    } on PlatformException catch (exception) {
      if (exception.code == BarcodeScanner.cameraAccessDenied) {
        showAlertDialog(
            result: 'not grant permission to open the camera',
            context: context);
      } else {
        print('Unknown error: $exception');
      }
    } catch (exception) {
      print('Unknown error: $exception');
    }
  }

  showAlertDialog({required BuildContext context, required String result}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Result"),
          content: Text(result),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            )
          ],
        );
      },
    );
  }
}
