import 'package:flutter/material.dart';

class FormImagePickerResult {
  const FormImagePickerResult({
    this.name,
    this.image,
  });

  final String? name;
  final FileImage? image;
}
