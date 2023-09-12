import 'package:flutter/cupertino.dart';
import 'package:stock/src/pages/pages.dart';

// import 'package:stock/src/pages/home/home_page.dart';
// import 'package:stock/src/pages/login/login_page.dart';

class Route {
  static const home = '/home';
  static const login = '/login';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
  };
}
