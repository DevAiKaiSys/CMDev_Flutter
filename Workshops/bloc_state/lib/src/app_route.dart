import 'package:bloc_state/src/pages/another_page.dart';
import 'package:bloc_state/src/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static const home = 'home';
  static const another = 'another';

  final _route = <String, WidgetBuilder>{
    home: (context) => MyHomePage(title: "HomePage"),
    another: (context) => AnotherPage(title: "AnotherPage"),
  };

  get getAll => _route;
}
