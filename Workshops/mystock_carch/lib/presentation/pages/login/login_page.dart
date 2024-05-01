import 'package:flutter/material.dart';
import 'package:mystock_carch/configs/theme.dart' as customTheme;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: customTheme.Theme.gradient,
            ),
          ),
          const Column(
            children: [
              Text('header'),
              Text('form'),
              Text('forget password'),
              Text('SSO'),
              Text('register'),
            ],
          ),
        ],
      ),
    );
  }
}
