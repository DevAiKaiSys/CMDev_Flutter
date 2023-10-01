import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_cropper/image_cropper.dart';

class ProductImage extends StatefulWidget {
  final Function(File imageFile) callBack;

  const ProductImage(this.callBack, {super.key});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  // File? _imageFile;
  XFile? _pickedFile;
  CroppedFile? _croppedFile;
  final ImagePicker picker = ImagePicker();

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
          _modalPickerImage();
        },
        label: Text('image'),
        icon: FaIcon(FontAwesomeIcons.image),
      );

  _buildPreviewImage() {
    // if (_imageFile == null) {
    //   return SizedBox();
    // }

    final container = (Widget child) => Container(
          color: Colors.grey[100],
          margin: EdgeInsets.only(top: 4),
          alignment: Alignment.center,
          height: 350,
          child: child,
        );

    // return Stack(children: [
    //   container(Image.file(_imageFile!)),
    //   _buildDeleteImageButton(),
    // ]);

    String? path;
    if (_croppedFile != null) {
      path = _croppedFile!.path;
    } else if (_pickedFile != null) {
      path = _pickedFile!.path;
    }

    if (path != null) {
      return Stack(children: [
        container(Image.file(File(path))),
        _buildDeleteImageButton(),
      ]);
    }

    return const SizedBox.shrink();
  }

  _buildDeleteImageButton() => Positioned(
        right: 0,
        child: IconButton(
          onPressed: () {
            setState(() {
              // _imageFile = null;
              _pickedFile = null;
              _croppedFile = null;
            });
          },
          icon: Icon(
            Icons.clear,
            color: Colors.black54,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      );

  void _modalPickerImage() {
    final buildListTile =
        (IconData icon, String title, ImageSource imageSource) => ListTile(
              leading: Icon(icon),
              title: Text(title),
              onTap: () async {
                var isGranted = false;
                if (imageSource == ImageSource.camera) {
                  if (await Permission.camera.request().isGranted) {
                    isGranted = true;
                  } else if (await Permission.camera.isPermanentlyDenied) {
                    openAppSettings();
                  }
                }
                if (imageSource == ImageSource.gallery) {
                  if (await Permission.photos.request().isGranted) {
                    isGranted = true;
                  } else if (await Permission.photos.isPermanentlyDenied) {
                    openAppSettings();
                  }
                }
                if (isGranted) {
                  Navigator.pop(context);
                  _pickImage(imageSource);
                }
              },
            );

    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildListTile(
            Icons.photo_camera,
            "Take a picture from camera",
            ImageSource.camera,
          ),
          buildListTile(
            Icons.photo_library,
            "Choose from photo library",
            ImageSource.gallery,
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource imageSource) async {
    // Pick an image.
    // final XFile? image = await picker.pickImage(source: imageSource);
    await picker
        .pickImage(
      source: imageSource,
      imageQuality: 70,
      maxHeight: 500,
      maxWidth: 500,
    )
        .then((file) {
      if (file != null) {
        // setState(() {
        //   _imageFile = File(file.path);
        // });
        _cropImage(file.path);
      }
    });
  }

  void _cropImage(String path) {
    ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    ).then((file) {
      if (file != null) {
        setState(() {
          _croppedFile = file;
          widget.callBack(File(_croppedFile!.path));
        });
      }
    });
  }
}
