import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock/src/config/theme.dart' as custom_theme;
import 'package:stock/src/pages/login/widgets/header.dart';
import 'package:stock/src/pages/login/widgets/login_form.dart';
import 'package:stock/src/pages/login/widgets/single_sign_on.dart';

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
          SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                LoginForm(),
                SizedBox(height: 30),
                _buildTextButton(
                  'Forgot Password?',
                  onPressed: () {
                    //todo
                  },
                ),
                SingleSignOn(),
                SizedBox(height: 30),
                _buildTextButton(
                  "Don't have an Account",
                  onPressed: () {
                    //todo
                  },
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _buildTextButton(String text,
          {VoidCallback? onPressed, double fontSize = 16}) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
