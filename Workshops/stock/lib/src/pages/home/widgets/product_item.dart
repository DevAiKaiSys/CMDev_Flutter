import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;

  const ProductItem(this.maxHeight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildImage(),
          _buildInfo(),
        ],
      ),
    );
  }

  Image _buildImage() {
    final height = maxHeight * 0.7;
    final productImage =
        'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png';

    return Image.network(
      productImage,
      // height: 350,
      height: height,
    );
  }

  _buildInfo() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$4444'),
                  Text('1234 pieces'),
                ],
              )
            ],
          ),
        ),
      );
}
