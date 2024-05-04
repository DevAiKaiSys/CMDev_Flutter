import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_carch/configs/route.dart' as custom_route;
import 'package:mystock_carch/constants/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          const Spacer(),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.rightFromBracket,
              color: Colors.grey,
            ),
            // trailing: const FaIcon(
            //   FontAwesomeIcons.rightFromBracket,
            //   color: Colors.grey,
            // ),
            title: const Text('Logut'),
            onTap: showDialogLogout,
          ),
        ],
      ),
    );
  }

  void showDialogLogout() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Logout'),
              onPressed: () {
                SharedPreferences.getInstance().then((prefs) {
                  prefs.remove(Setting.tokenPref);
                  //prefs.clear();
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
}
