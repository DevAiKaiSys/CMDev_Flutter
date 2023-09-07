import 'package:flutter/material.dart';
import 'package:sqlite/db_provider.dart';
import 'package:sqlite/models/product.dart';

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

  late DBProvider dbProvider;

  @override
  void initState() {
    dbProvider = DBProvider();
    super.initState();
  }

  @override
  void dispose() {
    dbProvider.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
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

  _buildContent() {
    return RefreshIndicator(
      key: _refresh,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
        setState(() {});
      },
      child: FutureBuilder(
          future: dbProvider.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data as List<Product>;
              if (products.length > 0) {
                return _buildListView(products.reversed.toList());
              }
              return Center(
                child: Text("NO DATA"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  _buildListView(List<Product> products) => ListView.separated(
        itemBuilder: (context, position) {
          Product product = products[position];
          return ListTile(
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            title: Text("${product.name}. (${product.stock})"),
            subtitle: Text("price: ${product.price}"),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {},
            ),
          );
        },
        separatorBuilder: (context, position) {
          return Divider();
        },
        itemCount: products.length,
      );

  _buildBody() => FutureBuilder(
        future: dbProvider.initDB(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildContent();
          }
          return Center(
            child: snapshot.hasError
                ? Text(snapshot.error.toString())
                : CircularProgressIndicator(),
          );
        },
      );
}
