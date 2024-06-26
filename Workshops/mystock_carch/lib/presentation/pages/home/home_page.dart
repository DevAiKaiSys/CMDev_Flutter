import 'package:flutter/material.dart';
import 'package:mystock_carch/presentation/pages/home/widgets/custom_drawer.dart';
import 'package:mystock_carch/presentation/pages/home/widgets/custom_tabbar.dart';
import 'package:mystock_carch/presentation/viewmodels/tab_menu_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key /*, this.name = '-', this.age = 0*/
      });

  // final String name;
  // final int age;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabsMenu = TabMenuViewModel().items;

  @override
  Widget build(BuildContext context) {
    /*final Map<Object, Object> arguments =
        (ModalRoute.of(context)?.settings.arguments) as Map<Object, Object>;
    final models = Map<String, Object>.from(arguments);

    var name = '-';
    var age = 30;
    if (models['name'] is String) {
      name = models['name'] as String;
    }
    if (models['age'] is int) {
      age = models['age'] as int;
    }*/

    return DefaultTabController(
      length: /*3*/ _tabsMenu.length,
      child: Scaffold(
        body:
            /*// Image(image: AssetImage('assets/images/logo.png')),
            // Image.asset('assets/images/logo.png'),
            Column(
          children: [
            Image.asset(Asset.logoImage),
            Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/4cdf1c5482cd30174cfe.png'),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/fade_logo.png',
              image:
                  'https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png',
            ),
          ],
        ),*/
            /*Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('back'),
              ),
              // Text(widget.name),
              // Text(widget.age.toString()),
              // Text(name),
              // Text(age.toString()),
            ],
          ),
        ),*/
            /*Image.asset('assets/images/logo.png')*/
            TabBarView(
          /*children: [
            */ /*FlutterLogo(
              style: FlutterLogoStyle.horizontal,
            ),
            FlutterLogo(
              style: FlutterLogoStyle.stacked,
            ),
            FlutterLogo(),*/ /*
            Stock(),
            Chart(),
            Report(),
          ],*/
          children: _tabsMenu.map((item) => item.widget).toList(),
        ),
        appBar: _buildAppBar(),
        drawer: const CustomDrawer(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Stock Workshop'),
      bottom: CustomTabBar(tabsMenu: _tabsMenu),
      actions: [
        IconButton(
          onPressed: () {
            // todo
          },
          icon: const Icon(Icons.bookmark_border),
        ),
        IconButton(
          onPressed: () {
            // todo
          },
          icon: const Icon(Icons.qr_code),
        ),
      ],
    );
  }
}
