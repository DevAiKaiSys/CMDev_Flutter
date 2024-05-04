import 'package:flutter/material.dart';
import 'package:mystock_carch/presentation/pages/home/widgets/product_item.dart';

class Stock extends StatelessWidget {
  const Stock({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) =>
          /*Text(
        index.toString(),
      )*/
          LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return ProductItem(maxHeight: constraints.maxHeight);
        },
      ),
      itemCount: 5,
    );
  }
}
