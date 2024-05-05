import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:mystock_carch/data/datasources/product_remote.dart';
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
  File? _imageFile;

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
              ProductImage(callBack),
            ],
          ),
        ),
      ),
    );
  }

  callBack(File imageFile) {
    _imageFile = imageFile;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_isEdit ? 'Edit Product' : 'Create Product'),
      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () {
            _form.currentState?.save();
            /*debugPrint(_product.name);
            debugPrint('${_product.price}');
            debugPrint('${_product.stock}');*/
            addProduct();
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

  void addProduct() {
    var productDatasource = GetIt.instance<ProductRemoteDataSource>();

    productDatasource
        .addProduct(_product, imageFile: _imageFile)
        .then((result) {
      /*debugPrint(result);*/
      Navigator.pop(context);
      showAlertBar(result);
    }).catchError((error) {
      showAlertBar(
        error.toString(),
        icon: FontAwesomeIcons.circleXmark,
        color: Colors.red,
      );
    });
  }

  void showAlertBar(String message,
      {IconData icon = FontAwesomeIcons.circleCheck,
      Color color = Colors.green}) {
    Flushbar(
      message: message,
      icon: FaIcon(
        icon,
        size: 28.0,
        color: color,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context);
  }
}
