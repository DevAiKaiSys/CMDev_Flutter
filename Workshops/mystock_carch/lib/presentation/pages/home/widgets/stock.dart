import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:mystock_carch/configs/route.dart' as custom_route;
import 'package:mystock_carch/data/datasources/product_remote.dart';
import 'package:mystock_carch/data/models/product.dart';
import 'package:mystock_carch/presentation/pages/home/widgets/product_item.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  final _spacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNetwork(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, custom_route.Route.management)
              .then((value) => setState(() {}));
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }

  FutureBuilder<List<Product>> _buildNetwork() {
    var products = GetIt.instance<ProductRemoteDataSource>();

    return FutureBuilder<List<Product>>(
      future: products.getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? products = snapshot.data;
          if (products == null || products.isEmpty) {
            return Container(
              margin: const EdgeInsets.only(top: 22),
              alignment: Alignment.topCenter,
              child: const Text('No data'),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: _buildProductGridView(products),
          );
        }
        if (snapshot.hasError) {
          return Container(
            margin: const EdgeInsets.only(top: 22),
            alignment: Alignment.topCenter,
            child: /*Text(snapshot.error.toString())*/
                Text((snapshot.error as DioException).message ?? "error?"),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  GridView _buildProductGridView(List<Product> products) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: _spacing,
        right: _spacing,
        top: _spacing,
        bottom: 150,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: _spacing,
        mainAxisSpacing: _spacing,
      ),
      itemBuilder: (context, index) =>
          /*Text(
        index.toString(),
      )*/
          LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return ProductItem(
              maxHeight: constraints.maxHeight, product: products[index]);
        },
      ),
      itemCount: products.length,
    );
  }
}
