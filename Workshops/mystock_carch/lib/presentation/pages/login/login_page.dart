import 'package:flutter/material.dart';
import 'package:mystock_carch/configs/theme.dart' as custom_theme;
import 'package:mystock_carch/presentation/pages/login/widgets/single_sign_on.dart';

import 'widgets/header.dart';
import 'widgets/login_form.dart';

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
              gradient: custom_theme.Theme.gradient,
            ),
          ),
          // init layout
          // const Column(
          //   children: [
          //     Text('header'),
          //     Text('form'),
          //     Text('forget password'),
          //     Text('SSO'),
          //     Text('register'),
          //   ],
          // ),
          SingleChildScrollView(
            child: Column(
              children: [
                // Text('header'),
                const Header(),
                // Text('form'),
                const LoginForm(),
                // Text('forget password'),
                const SizedBox(height: 30),
                _buildTextButton(
                  'Forgot Password?',
                  onPressed: () {
                    //todo
                  },
                ),
                // Text('SSO'),
                const SingleSignOn(),
                // Text('register'),
                const SizedBox(height: 28),
                _buildTextButton(
                  "Don't have an Account",
                  onPressed: () {
                    //todo
                  },
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _buildTextButton(String text,
      {VoidCallback? onPressed, double fontSize = 16}) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ));
  }
}
