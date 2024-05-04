import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: false,
      ),
      body: const Center(
        child: FlutterLogo(
          size: 150,
        ),
      ),
    );
  }
}
