import 'package:flutter/material.dart';
import 'package:mystock_carch/presentation/pages/index.dart';

class Route {
  static const home = '/home';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const management = '/management';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    dashboard: (context) => const DashBoardPage(),
  };
}
