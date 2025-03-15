import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketi/core/helper/extensions.dart';

class ImagePickerHelper {
  static showOption({BuildContext? context, ValueChanged<File>? onGet}) {
    showDialog(
      context: context!,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Center(
            child: Text(
              "Image",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                "Gallery",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () => openGallery(context: context, onGet: onGet),
            ),
            CupertinoDialogAction(
              child: Text(
                "Camera",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () => openCamera(context: context, onGet: onGet),
            ),
          ],
        );
      },
    );
  }

  static openGallery({
    required BuildContext context,
    ValueChanged<File>? onGet,
  }) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    onGet!(File(image!.path));
  }

  static openCamera({
    required BuildContext context,
    ValueChanged<File>? onGet,
  }) async {
    context.pop();
    var image = await ImagePicker().pickImage(
      source: ImageSource.camera, // alternatively, use ImageSource.gallery
    );
    onGet!(File(image!.path));
  }
}
