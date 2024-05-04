import 'package:flutter/material.dart';
import 'package:mystock_carch/presentation/utils/format.dart';
import 'package:mystock_carch/presentation/widgets/image_not_found.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;

  const ProductItem({super.key, required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo
        debugPrint('click product');
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

  _buildImage() {
    final height = maxHeight * 0.7;
    const productImage =
        // 'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png';
        '';

    const stock = 0;

    // return Image.network(
    //   productImage,
    //   height: /*350*/ height,
    // );
    return Stack(
      children: [
        /*Image.network(
          productImage,
          height: height,
          width: double.infinity,
        ),
        _buildOutofStock(),*/
        SizedBox(
          width: double.infinity,
          height: height,
          child: productImage.isNotEmpty
              ? Image.network(
                  productImage,
                )
              : const ImageNotFound(),
        ),
        if (stock <= 0) _buildOutofStock(),
      ],
    );
  }

  Expanded _buildInfo() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text('1234 pieces'),
                  Text(
                    '${formatNumber.format(9999)} pieces',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Positioned _buildOutofStock() => const Positioned(
        top: 2,
        right: 2,
        child: Card(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
