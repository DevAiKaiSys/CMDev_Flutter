import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_carch/presentation/viewmodels/tab_menu_view_model.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<TabMenu> tabsMenu;

  const CustomTabBar({super.key, required this.tabsMenu});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      /*tabs: [
        Tab(
          child: Text('stock'),
        ),
        Tab(
          child: Text('chart'),
        ),
        Tab(
          child: Text('report'),
        ),
      ],*/
      tabs: tabsMenu
          .map((item) => Tab(
                child: Row(
                  children: [
                    FaIcon(item.icon),
                    const SizedBox(width: 32),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 18,
                        // color: Colors.white,
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
