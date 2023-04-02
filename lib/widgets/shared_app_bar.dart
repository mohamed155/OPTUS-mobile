import 'package:flutter/material.dart';
import 'package:tech2/screens/images.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({
    super.key,
    required this.menuButtonHandler,
    this.refreshButtonHandler,
  });

  final VoidCallback menuButtonHandler;
  final VoidCallback? refreshButtonHandler;

  @override
  Widget build(BuildContext context) {
    void openImagesScreen() {
      Navigator.of(context).push(
        MaterialPageRoute<ImagesScreen>(
            builder: (context) => const ImagesScreen()),
      );
    }

    return AppBar(
      centerTitle: false,
      title: Row(
        children: [
          IconButton(
            onPressed: openImagesScreen,
            icon: const Icon(Icons.camera_alt),
          ),
          const Expanded(
            child: Center(
              child: SizedBox(
                width: 120,
                child: Image(image: AssetImage('assets/images/logo-white.png')),
              ),
            ),
          ),
        ],
      ),
      leading: IconButton(
        onPressed: menuButtonHandler,
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: refreshButtonHandler ?? () {},
          icon: const Icon(Icons.refresh),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
