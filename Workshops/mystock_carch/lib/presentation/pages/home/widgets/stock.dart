import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mystock_carch/data/datasources/post_remote.dart';
import 'package:mystock_carch/data/models/post.dart';
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
    var posts = GetIt.instance<PostRemoteDataSource>();

    return FutureBuilder<List<Post>>(
      future: posts.fetchPosts(0),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Post>? posts = snapshot.data;
          if (posts == null || posts.isEmpty) {
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
            child: _buildProductGridView(posts),
          );
        }
        if (snapshot.hasError) {
          return Container(
            margin: const EdgeInsets.only(top: 22),
            alignment: Alignment.topCenter,
            child: Text(snapshot.error.toString()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  GridView _buildProductGridView(List<Post> posts) {
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
          return ProductItem(maxHeight: constraints.maxHeight);
        },
      ),
      itemCount: posts.length,
    );
  }
}
