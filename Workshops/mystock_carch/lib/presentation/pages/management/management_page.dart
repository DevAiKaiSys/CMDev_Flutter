import 'package:flutter/material.dart';
import 'package:mystock_carch/data/models/product.dart';

import 'widgets/product_image.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  late bool _isEdit;
  final _spacing = 12.0;
  late Product _product;
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    _isEdit = false;
    _product = Product();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: /*AppBar(
        title: Text(_isEdit ? 'Edit Product' : 'Create Product'),
      )*/
          _buildAppBar(),
      body: Form(
        key: _form,
        child: Padding(
          padding: EdgeInsets.all(_spacing),
          child: Column(
            children: [
              _buildNameInput(),
              SizedBox(height: _spacing),
              Row(
                children: [
                  Flexible(child: _buildPriceInput()),
                  SizedBox(width: _spacing),
                  Flexible(child: _buildStockInput()),
                ],
              ),
              const ProductImage(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_isEdit ? 'Edit Product' : 'Create Product'),
      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () {
            _form.currentState?.save();
            debugPrint(_product.name);
            debugPrint('${_product.price}');
            debugPrint('${_product.stock}');
          },
          child: const Text('submit'),
        )
      ],
    );
  }

  InputDecoration inputStyle(label) => InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black12,
          width: 2,
        ),
      ),
      labelText: label);

  TextFormField _buildNameInput() => TextFormField(
        initialValue: _product.name,
        decoration: inputStyle('name'),
        onSaved: (value) {
          _product.name = (value!.isEmpty ? '-' : value);
        },
      );

  TextFormField _buildPriceInput() => TextFormField(
        initialValue: _product.price?.toString(),
        decoration: inputStyle('price'),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          _product.price = value!.isEmpty ? 0 : int.parse(value);
        },
      );

  TextFormField _buildStockInput() => TextFormField(
        initialValue: _product.stock?.toString(),
        decoration: inputStyle('stock'),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          _product.stock = value!.isEmpty ? 0 : int.parse(value);
        },
      );
}
