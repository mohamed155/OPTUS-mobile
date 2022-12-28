import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech2/services/navigation_service.dart';

class ImageChooser {
  static Future<Image>? chooseImage() {
    Completer<Image> completer = Completer();
    BuildContext? context = NavigationService.navigationKey.currentContext;
    if (context != null) {
      showAdaptiveActionSheet(
          context: context,
          title: const Text('Choose an image from'),
          actions: [
            BottomSheetAction(title: const Text('Camera'), onPressed: (_) {
              Navigator.of(context).pop();
              chooseImageFromSource(ImageSource.camera)
                  .then((Image image) => completer.complete(image));
            }),
            BottomSheetAction(title: const Text('Gallery'), onPressed: (_) {
              Navigator.of(context).pop();
              chooseImageFromSource(ImageSource.gallery)
                  .then((Image image) => completer.complete(image));
            })
          ],
        cancelAction: CancelAction(title: const Text('Cancel'))
      );
    }
    return completer.future;
  }

  static Future<Image> chooseImageFromSource(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: source);
    return Image.file(File(image!.path));
  }
}