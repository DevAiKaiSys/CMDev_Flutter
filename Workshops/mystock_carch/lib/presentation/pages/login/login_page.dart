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
          const Column(
            children: [
              // Text('header'),
              Header(),
              // Text('form'),
              LoginForm(),
              Text('forget password'),
              // Text('SSO'),
              SingleSignOn(),
              Text('register'),
            ],
          ),
        ],
      ),
    );
  }
}
