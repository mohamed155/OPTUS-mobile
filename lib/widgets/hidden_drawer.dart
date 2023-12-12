import 'package:flutter/material.dart';
import 'package:tech2/models/drawer_item.dart';
import 'package:tech2/models/drawer_items.dart';
import 'package:tech2/modules/jobs/screens/job_home.dart';
import 'package:tech2/modules/map/map.dart';
import 'package:tech2/services/security.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

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

  void openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 160;
      scaleFactor = 0.6;
      drawerOpened = true;
      screenBorderRadius = 20;
    });
  }

  void closeDrawer() {
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
              child: SingleChildScrollView(child: buildDrawerItems(context)),
            ),
          ),
        ),
        buildCurrentScreen(context),
      ],
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
      children: [
        ...DrawerItems.all.map(
          (item) => ListTile(
            leading: Icon(item.icon, color: Colors.white),
            title: Text(
              item.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              setState(() => selectedItem = item);
              closeDrawer();
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.white),
          title: const Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onTap: SecurityService().logout,
        ),
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
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                spreadRadius: 5,
                blurRadius: 15,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(screenBorderRadius),
            child: AbsorbPointer(
              absorbing: drawerOpened,
              child: buildSelectedScreen(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSelectedScreen(BuildContext context) {
    switch (selectedItem) {
      case DrawerItems.jobs:
        return JobsHomeScreen(openDrawer: openDrawer);
      case DrawerItems.map:
        return MapScreen(
          openDrawer: openDrawer,
        );
      default:
        return JobsHomeScreen(openDrawer: openDrawer);
    }
  }
}
