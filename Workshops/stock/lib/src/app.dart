import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock/src/constants/setting.dart';
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
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder:
            // (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
            (context, snapshot) {
          if (snapshot.hasData) {
            final token = snapshot.data?.getString(Setting.TOKEN_PREF) ?? '';
            if (token.isNotEmpty) {
              return HomePage();
            }
            return LoginPage();
          }
          return SizedBox();
        },
      ),
    );
  }
}
