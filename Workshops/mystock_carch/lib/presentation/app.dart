import 'package:flutter/material.dart';
import 'package:mystock_carch/configs/route.dart' as custom_route;
import 'package:mystock_carch/presentation/pages/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: custom_route.Route.getAll(),
      title: 'MyStock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // const HomePage(title: 'Flutter Demo Home Page'),
          const LoginPage(),
    );
  }
}
