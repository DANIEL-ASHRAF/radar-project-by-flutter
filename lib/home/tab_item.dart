
import 'package:flutter/material.dart';

enum TabItem { radar, launcher }

class TabItemData {
  const TabItemData({@required this.title, @required this.imageOn,@required this.imageOff});

  final String title;
//  final IconData icon;
  final AssetImage imageOn;
  final AssetImage imageOff;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.radar: TabItemData(title: 'Radar',imageOn:AssetImage('assets/radar_on.png'),imageOff:AssetImage('assets/radar_off.png') ),
    TabItem.launcher: TabItemData(title: 'Launcher',imageOn:AssetImage('assets/launcher_on.png'),imageOff: AssetImage('assets/launcher_off.png')),
  };
}