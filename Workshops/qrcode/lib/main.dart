import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
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
                  _buildScan(),
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

  _buildScan() => Column(
        children: [
          Image.asset(
            "assets/ic_scan_qrcode.png",
            width: 110,
            height: 110,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            child: Text("SCAN"),
            onPressed: () {},
          )
        ],
      );

  _buildGenerator() => Column(
        children: [
          Image.asset(
            "assets/ic_generate_qrcode.png",
            width: 110,
            height: 110,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            child: Text("GENERATE"),
            onPressed: () {},
          )
        ],
      );
}