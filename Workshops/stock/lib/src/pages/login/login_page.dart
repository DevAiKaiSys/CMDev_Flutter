import 'package:flutter/material.dart';
import 'package:stock/src/config/theme.dart' as custom_theme;
import 'package:stock/src/pages/login/widgets/header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // วาง widget ซ้อนกันได้
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: custom_theme.Theme.gradient,
            ),
          ),
          Column(
            children: [
              Header(),
              Text('form'),
              Text('forgot password'),
              Text('SSO'),
              Text('register'),
            ],
          ),
        ],
      ),
    );
  }
}
