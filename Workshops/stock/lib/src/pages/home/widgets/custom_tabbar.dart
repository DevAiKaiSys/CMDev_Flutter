import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: [
      Tab(
        child: Text('stock'),
      ),
      Tab(
        child: Text('chart'),
      ),
      Tab(
        child: Text('report'),
      ),
    ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
