import 'package:flutter/material.dart';
import 'package:tech2/models/form_image_picker_result.dart';
import 'package:tech2/services/image_chooser.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({
    super.key,
    this.image,
    this.onSelectImage,
    this.hasErrors,
  });

  final Image? image;
  final void Function(FileImage? image, String? name)? onSelectImage;
  final bool? hasErrors;

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  Image? image;
  void Function(FileImage? image, String? name)? onSelectImage;

  @override
  void initState() {
    super.initState();
    image = widget.image;
    onSelectImage = widget.onSelectImage;
  }

  void _selectImage() {
    ImageChooser().chooseImage()?.then((FormImagePickerResult result) {
      if (result.image != null) {
        setState(() => image = Image.file(result.image!.file));
        onSelectImage!(result.image, result.name);
      }
    });
  }

  void _cancelImage() {
    setState(() => image = null);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: (widget.hasErrors != null && widget.hasErrors!)
              ? Theme.of(context).primaryColor
              : Colors.transparent,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white60),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.white38),
              BoxShadow(
                color: Colors.white60,
                spreadRadius: -1,
                blurRadius: 1,
              ),
            ],
          ),
          child: image != null
              ? SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(child: image),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: FloatingActionButton.small(
                          onPressed: _cancelImage,
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: ElevatedButton(
                    onPressed: _selectImage,
                    child: const Text('Select Image'),
                  ),
                ),
        ),
      ),
    );
  }
}
