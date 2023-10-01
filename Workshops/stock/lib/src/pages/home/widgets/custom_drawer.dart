import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock/src/constants/setting.dart';
import 'package:stock/src/config/route.dart' as custom_route;
import 'package:stock/src/viewmodels/menu_view_model.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildProfile(),
          ..._buildMainMenu(),
          Spacer(),
          // TextButton(
          //   onPressed: () {
          //     //todo
          //   },
          //   child: Text('logout'),
          // )
          SafeArea(
            child: ListTile(
              leading: FaIcon(
                // FontAwesomeIcons.signOutAlt,
                FontAwesomeIcons.rightFromBracket,
                color: Colors.grey,
              ),
              // trailing: FaIcon(
              //   FontAwesomeIcons.rightFromBracket,
              //   color: Colors.grey,
              // ),
              title: Text('Logout'),
              onTap: showDialogLogout,
            ),
          ),
        ],
      ),
    );
  }

  void showDialogLogout() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // กดข้างนอกแล้วปิด dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text('Logout'),
              onPressed: () {
                SharedPreferences.getInstance().then((prefs) {
                  prefs.remove(Setting.TOKEN_PREF);
                  // prefs.clear();
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    custom_route.Route.login,
                    (route) => false,
                  );
                });
              },
            ),
          ],
        );
      },
    );
  }

  _buildProfile() => UserAccountsDrawerHeader(
        // decoration: BoxDecoration(color: Colors.red),
        accountName: Text('data'),
        accountEmail: Text('dev@mail.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png',
          ),
        ),
      );

  List<ListTile> _buildMainMenu() => MenuViewModel()
      .items
      .map((item) => ListTile(
            title: Text(
              item.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            leading: Badge(
              // showBadge: item.icon == FontAwesomeIcons.inbox,
              isLabelVisible: item.icon == FontAwesomeIcons.inbox,
              // badgeContent: Text(
              label: Text(
                '99',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              // badgeColor: Colors.red,
              textColor: Colors.red,
              child: FaIcon(
                item.icon,
                color: item.iconColor,
              ),
            ),
            onTap: () {
              item.onTap(context);
            },
          ))
      .toList();
}
