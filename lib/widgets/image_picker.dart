import 'package:flutter/material.dart';
import 'package:tech2/services/image_chooser.dart';

class ImagePicker extends StatefulWidget {
  final Image? image;
  final void Function(Image? image)? onSelectImage;

  const ImagePicker({Key? key, this.image, this.onSelectImage})
      : super(key: key);

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  Image? image;
  void Function(Image? image)? onSelectImage;

  @override
  void initState() {
    super.initState();
    image = widget.image;
    onSelectImage = widget.onSelectImage;
  }

  _selectImage() {
    ImageChooser.chooseImage()?.then((Image img) {
      setState(() => image = img);
    });
    if (onSelectImage != null) {
      onSelectImage!(image);
    }
  }

  _cancelImage() {
    setState(() => image = null);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white60),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.white38),
              BoxShadow(color: Colors.white60, spreadRadius: -1, blurRadius: 1)
            ]),
        child: image != null
            ? SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Center(child: image!),
                    Positioned(
                        top: 5,
                        right: 5,
                        child: FloatingActionButton.small(
                          onPressed: _cancelImage,
                          child: const Icon(Icons.close),
                        ))
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
    );
  }
}
