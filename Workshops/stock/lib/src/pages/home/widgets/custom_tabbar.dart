import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock/src/viewmodels/tabmenu_view_model.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<TabMenu> tabsMenu;

  const CustomTabBar(this.tabsMenu, {super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // tabs: [
      //   Tab(
      //     child: Text('stock'),
      //   ),
      //   Tab(
      //     child: Text('chart'),
      //   ),
      //   Tab(
      //     child: Text('report'),
      //   ),
      // ],
      tabs: tabsMenu
          .map((item) => Tab(
                child: Row(
                  children: [
                    FaIcon(item.icon),
                    SizedBox(width: 12),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 18,
                        // color: Colors.white,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
