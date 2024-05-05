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

  var productDatasource = GetIt.instance<ProductRemoteDataSource>();

  @override
  void initState() {
    _isEdit = false;
    _product = Product();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Product) {
      _isEdit = true;
      _product = arguments;
    }

    return Scaffold(
      appBar: /*AppBar(
        title: Text(_isEdit ? 'Edit Product' : 'Create Product'),
      )*/
          _buildAppBar(),
      body: SingleChildScrollView(
        child: Form(
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
                ProductImage(callBack, _product.image),
                const SizedBox(width: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  callBack(File? imageFile) {
    _imageFile = imageFile;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_isEdit ? 'Edit Product' : 'Create Product'),
      actions: [
        if (_isEdit) _buildDeleteButoon(),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () {
            _form.currentState?.save();
            /*debugPrint(_product.name);
            debugPrint('${_product.price}');
            debugPrint('${_product.stock}');*/
            /*addProduct();*/
            FocusScope.of(context).requestFocus(FocusNode()); // ปิด keyboard
            if (_isEdit) {
              editProduct();
            } else {
              addProduct();
            }
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

  _buildDeleteButoon() => IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text('Delete Product'),
                content: const Text('Are you sure you want to delete?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('cancel'),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'ok',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Dis
                      deleteProduct(); // miss alert dialog
                    },
                  ),
                ],
              );
            },
          );
        },
      );

  void deleteProduct() {
    productDatasource.deleteProduct(_product.id!).then((result) {
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

  void editProduct() {
    productDatasource
        .editProduct(_product, imageFile: _imageFile)
        .then((result) {
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
}
