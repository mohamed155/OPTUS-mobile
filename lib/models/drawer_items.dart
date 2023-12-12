import 'package:flutter/material.dart';

import './drawer_item.dart';

class DrawerItems {
  factory DrawerItems() {
    return _instance;
  }

  DrawerItems._create();

  static final _instance = DrawerItems._create();

  static const jobs = DrawerItem(title: 'Jobs', icon: Icons.construction);
  static const map = DrawerItem(title: 'Map', icon: Icons.map_outlined);
  static const mail = DrawerItem(title: 'Mail', icon: Icons.mail);
  static const library =
      DrawerItem(title: 'Library', icon: Icons.collections_bookmark_sharp);
  static const timeSheet = DrawerItem(title: 'Time Sheet', icon: Icons.timer);
  static const myStuff =
      DrawerItem(title: 'My Stuff', icon: Icons.work_outline);
  static const performance =
      DrawerItem(title: 'Performance', icon: Icons.insert_chart);
  static const availability =
      DrawerItem(title: 'Availability', icon: Icons.event_available);
  static const safetySMWS =
      DrawerItem(title: 'Safety SMWS', icon: Icons.warning);
  static const banking =
      DrawerItem(title: 'Banking', icon: Icons.account_balance);
  static const stock = DrawerItem(title: 'Stock', icon: Icons.inventory);
  static const notifications =
      DrawerItem(title: 'Notifications', icon: Icons.notifications);

  static final List<DrawerItem> all = [
    jobs,
    map,
    mail,
    library,
    timeSheet,
    myStuff,
    performance,
    availability,
    safetySMWS,
    banking,
    stock,
    notifications,
  ];
}
