import 'package:flutter/material.dart';
import 'package:tech2/screens/images.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback menuButtonHandler;
  final VoidCallback refreshButtonHandler;

  const SharedAppBar({
    Key? key,
    required this.menuButtonHandler,
    required this.refreshButtonHandler
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    openImagesScreen() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ImagesScreen())
      );
    }

    return AppBar(
      centerTitle: false,
      title: Row(
        children: [
          IconButton(onPressed: openImagesScreen, icon: const Icon(Icons.camera_alt),),
          const Expanded(
            child: Center(
              child: SizedBox(
                width: 120,
                child: Image(image: AssetImage('assets/images/logo-white.png'))
              ),
            ),
          ),
        ],
      ),
      leading: IconButton(onPressed: menuButtonHandler, icon: const Icon(Icons.menu),),
      actions: [
        IconButton(onPressed: refreshButtonHandler, icon: const Icon(Icons.refresh),),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings),),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
