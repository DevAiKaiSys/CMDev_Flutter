import 'package:flutter/material.dart';
import 'package:stock/src/pages/home/widgets/product_item.dart';

class Stock extends StatelessWidget {
  final _spacing = 4.0;

  const Stock({super.key});

  @override
  Widget build(BuildContext context) {
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
          return ProductItem(constraints.maxHeight);
        },
      ),
      itemCount: 5,
    );
  }
}
