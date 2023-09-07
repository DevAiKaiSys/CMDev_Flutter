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
      debugShowCheckedModeBanner: false,
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
        onPressed: () {
          createDialog();
        },
      ),
    );
  }

  _buildAppBar() => AppBar(
        title: Text("MY SQLite"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _refresh.currentState?.show();
              dbProvider.deleteAll();
            },
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
        },
      ),
    );
  }

  _buildListView(List<Product> products) => ListView.separated(
        itemBuilder: (context, position) {
          Product product = products[position];
          return ListTile(
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                editDialog(product);
              },
            ),
            title: Text("${product.name} (${product.stock})"),
            subtitle: Text("price: ${product.price}"),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () async {
                _refresh.currentState?.show();
                dbProvider.deleteProduct(product.id!);
                await Future.delayed(Duration(seconds: 2));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Item deleted"),
                  action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () {
                        _refresh.currentState?.show();
                        dbProvider
                            .insertProduct(product)
                            .then((value) => print(value));
                      }),
                ));
              },
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

  createDialog() {
    var _formKey = GlobalKey<FormState>();
    Product product = Product();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "name"),
                    onSaved: (value) {
                      product.name = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "price"),
                    onSaved: (value) {
                      product.price = double.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "stock"),
                    onSaved: (value) {
                      product.stock = int.parse(value!);
                    },
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            _refresh.currentState?.show();
                            Navigator.pop(context);
                            dbProvider
                                .insertProduct(product)
                                .then((value) => print(value));
                          }
                        },
                      ))
                ],
              ),
            ),
          );
        });
  }

  editDialog(Product product) {
    var _formKey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    initialValue: product.name,
                    decoration: InputDecoration(hintText: "name"),
                    onSaved: (value) {
                      product.name = value;
                    },
                  ),
                  TextFormField(
                    initialValue: product.price.toString(),
                    decoration: InputDecoration(hintText: "price"),
                    onSaved: (value) {
                      product.price = double.parse(value!);
                    },
                  ),
                  TextFormField(
                    initialValue: product.stock.toString(),
                    decoration: InputDecoration(hintText: "stock"),
                    onSaved: (value) {
                      product.stock = int.parse(value!);
                    },
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            _refresh.currentState?.show();
                            Navigator.pop(context);
                            dbProvider
                                .updateProduct(product)
                                .then((row) => print(row));
                          }
                        },
                      ))
                ],
              ),
            ),
          );
        });
  }
}
