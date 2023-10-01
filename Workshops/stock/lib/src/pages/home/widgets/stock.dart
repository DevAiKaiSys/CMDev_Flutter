import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock/src/models/post.dart';
import 'package:stock/src/models/product.dart';
import 'package:stock/src/pages/home/widgets/product_item.dart';
import 'package:stock/src/services/network_service.dart';
import 'package:stock/src/config/route.dart' as custom_route;

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
              .then((value) {
            setState(() {});
          });
        },
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }

  FutureBuilder<List<Product>> _buildNetwork() {
    return FutureBuilder<List<Product>>(
      future: NetworkService().getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? products = snapshot.data;
          if (products == null || products.isEmpty) {
            return Container(
              margin: EdgeInsets.only(top: 22),
              alignment: Alignment.topCenter,
              child: Text('No data'),
            );
          }
          return RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: _buildProductGridView(products));
        } else if (snapshot.hasError) {
          return Container(
            margin: EdgeInsets.only(top: 22),
            alignment: Alignment.topCenter,
            // child: Text(snapshot.error.toString()),
            child: Text((snapshot.error as DioException).message ?? "error?"),
          );
        }
        return Center(
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
        bottom: 150,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        // crossAxisSpacing: 5,
        // mainAxisSpacing: 5,
        crossAxisSpacing: _spacing,
        mainAxisSpacing: _spacing,
      ),
      itemBuilder: (context, index) =>
          // Text(index.toString()),
          // ProductItem(),
          LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return ProductItem(constraints.maxHeight, products[index]);
        },
      ),
      // itemCount: 5,
      itemCount: products.length,
    );
  }
}
