import 'package:flutter/material.dart';
import 'package:stock/src/utils/format.dart';
import 'package:stock/src/widgets/image_not_found.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;

  const ProductItem(this.maxHeight, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('xxxx');
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildImage(),
            _buildInfo(),
          ],
        ),
      ),
    );
  }

  Stack _buildImage() {
    final height = maxHeight * 0.65;
    final productImage =
        'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png';
        // '';
    final stock = 0;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: productImage != null && productImage.isNotEmpty
              ? Image.network(
                  productImage,
                  // height: 350,
                  // height: height,
                  // width: double.infinity,
                )
              : ImageNotFound(),
        ),
        if (stock <= 0) _buildOutofStock(),
      ],
    );
  }

  _buildInfo() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('\$4444'),
                  Text(
                    '฿${formatCurrency.format(1111)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${formatNumber.format(9999)} pieces',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  _buildOutofStock() => Positioned(
        top: 2,
        right: 2,
        child: Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              'out of stock',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
}
