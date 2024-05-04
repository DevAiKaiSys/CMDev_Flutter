import 'package:flutter/material.dart';
import 'package:mystock_carch/configs/route.dart' as custom_route;
import 'package:mystock_carch/constants/setting.dart';
import 'package:mystock_carch/presentation/pages/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            /*const HomePage(title: 'Flutter Demo Home Page'),*/
            /*const LoginPage(),*/
            FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (/*BuildContext*/ context,
              /*AsyncSnapshot<SharedPreferences> */ snapshot) {
            if (snapshot.hasData) {
              final token = snapshot.data?.getString(Setting.tokenPref) ?? '';
              if (token.isNotEmpty) {
                return const HomePage();
              }
              return const LoginPage();
            }
            return const SizedBox();
          },
        ));
  }
}
