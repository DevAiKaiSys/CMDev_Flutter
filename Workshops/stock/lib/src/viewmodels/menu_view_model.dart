import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock/src/config/route.dart' as custom_route;

class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;

  const Menu(
    this.title, {
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });
}

class MenuViewModel {
  List<Menu> get items => <Menu>[
        Menu(
          'Profile',
          icon: FontAwesomeIcons.user,
          iconColor: Colors.deepOrange,
          onTap: (context) {
            //todo
          },
        ),
        Menu(
          'Dashboard',
          icon: FontAwesomeIcons.chartPie,
          iconColor: Colors.green,
          onTap: (context) {
            Navigator.pushNamed(context, custom_route.Route.dashboard);
          },
        ),
        Menu(
          'Inbox',
          icon: FontAwesomeIcons.inbox,
          iconColor: Colors.amber,
          onTap: (context) {
            //todo
          },
        ),
        Menu(
          'Setting',
          // icon: FontAwesomeIcons.cogs,
          icon: FontAwesomeIcons.gears,
          iconColor: Colors.blueGrey,
          onTap: (context) {
            //todo
          },
        ),
      ];
}
