import 'package:flutter/material.dart';
import 'package:stock/src/pages/home/home_page.dart';
import 'package:stock/src/pages/login/login_page.dart';
import 'package:stock/src/config/route.dart' as custom_route;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: custom_route.Route.getAll(),
      // onGenerateRoute: ,
      title: 'MyStock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
