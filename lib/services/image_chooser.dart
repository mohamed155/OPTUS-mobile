import 'dart:async';
import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech2/services/navigation_service.dart';

import '../models/form_image_picker_result.dart';

class ImageChooser {
  factory ImageChooser() {
    return _instance;
  }

  ImageChooser._create();

  static final ImageChooser _instance = ImageChooser._create();

  Future<FormImagePickerResult>? chooseImage() {
    final completer = Completer<FormImagePickerResult>();
    final context = NavigationService().navigationKey.currentContext;
    if (context != null) {
      showAdaptiveActionSheet<void>(
        context: context,
        title: const Text('Choose an image from'),
        actions: [
          BottomSheetAction(
            title: const Text('Camera'),
            onPressed: (_) {
              Navigator.of(context).pop();
              chooseImageFromSource(ImageSource.camera)
                  .then(completer.complete);
            },
          ),
          BottomSheetAction(
            title: const Text('Gallery'),
            onPressed: (_) {
              Navigator.of(context).pop();
              chooseImageFromSource(ImageSource.gallery)
                  .then(completer.complete);
            },
          ),
        ],
        cancelAction: CancelAction(title: const Text('Cancel')),
      );
    }
    return completer.future;
  }

  Future<FormImagePickerResult> chooseImageFromSource(
    ImageSource source,
  ) async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: source);
    return FormImagePickerResult(
      name: image?.name,
      image: FileImage(File(image!.path)),
    );
  }
}
