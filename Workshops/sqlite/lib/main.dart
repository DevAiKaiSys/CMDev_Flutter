import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My SQLite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _refresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContext(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  _buildAppBar() => AppBar(
        title: Text("MY SQLite"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      );

  _buildContext() {
    return RefreshIndicator(
      key: _refresh,
      child: _buildListView(),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
        setState(() {});
      },
    );
  }

  _buildListView() => ListView.separated(
        itemBuilder: (context, position) {
          return ListTile(
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            title: Text("xxxx (xxxx)"),
            subtitle: Text("xxxx"),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {},
            ),
          );
        },
        separatorBuilder: (context, position) {
          return Divider();
        },
        itemCount: 10,
      );
}
