import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              //todo
            },
            child: Text('logout'),
          )
        ],
      ),
    );
  }
}
