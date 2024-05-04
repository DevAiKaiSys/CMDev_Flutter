import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          child: Text('stock'),
        ),
        Tab(
          child: Text('chart'),
        ),
        Tab(
          child: Text('report'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
