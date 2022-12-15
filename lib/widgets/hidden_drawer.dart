import 'package:flutter/material.dart';
import 'package:tech2/services/security.dart';

import '../models/drawer_items.dart';
import '../models/drawer_item.dart';
import '../modules/jobs/screens/job_search.dart';
import '../modules/map/map.dart';

class HiddenDrawer extends StatefulWidget {

  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool drawerOpened = false;
  double screenBorderRadius = 0;
  DrawerItem selectedItem = DrawerItems.jobs;

  openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 160;
      scaleFactor = 0.6;
      drawerOpened = true;
      screenBorderRadius = 20;
    });
  }

  closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      drawerOpened = false;
      screenBorderRadius = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SizedBox(
              width: xOffset,
              child: SingleChildScrollView(
                  child: buildDrawerItems(context)
              ),
            ),
          )
        ),
        buildCurrentScreen(context)
      ],
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
      children: [...DrawerItems.all.map((item) => ListTile(
        leading: Icon(item.icon, color: Colors.white),
        title: Text(
          item.title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        onTap: () {
          setState(() => selectedItem = item);
          closeDrawer();
        },
      )).toList(),
        const ListTile(
          leading: Icon(Icons.logout, color: Colors.white),
          title: Text(
            "Logout",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onTap: SecurityService.logout,
        )
      ],
    );
  }

  Widget buildCurrentScreen(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (drawerOpened) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragUpdate: (details) {
          const delta = 10;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2) ,spreadRadius: 5, blurRadius: 15)
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(screenBorderRadius),
            child: AbsorbPointer(
              absorbing: drawerOpened,
              child: buildSelectedScreen(context)
            ),
          )
        ),
      ),
    );
  }

  Widget buildSelectedScreen(BuildContext context) {
    switch (selectedItem) {
      case DrawerItems.jobs:
        return JobsSearchScreen(openDrawer: openDrawer);
      case DrawerItems.map:
        return MapScreen(openDrawer: openDrawer,);
      default:
        return JobsSearchScreen(openDrawer: openDrawer);
    }
  }
}
