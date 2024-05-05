import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({super.key});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPickerImage(),
          _buildPreviewImage(),
        ],
      ),
    );
  }

  OutlinedButton _buildPickerImage() => OutlinedButton.icon(
        onPressed: () {
          //todo
        },
        label: const Text('image'),
        icon: const FaIcon(FontAwesomeIcons.image),
      );

  _buildPreviewImage() {
    if (_imageFile == null) {
      return const SizedBox();
    }

    container(Widget child) => Container(
          color: Colors.grey[100],
          margin: const EdgeInsets.only(top: 4),
          alignment: Alignment.center,
          height: 350,
          child: child,
        );

    return Stack(children: [
      container(Image.file(_imageFile!)),
      _buildDeleteImageButton(),
    ]);
  }

  _buildDeleteImageButton() => Positioned(
        right: 0,
        child: IconButton(
          onPressed: () {
            //todo
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black54,
          ),
        ),
      );
}
