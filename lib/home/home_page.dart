
import 'package:flutter/material.dart';
import 'package:radar_project_app/home/tab_item.dart';
import 'package:radar_project_app/views/launcher_view.dart';
import 'package:radar_project_app/views/radar_view.dart';
import 'cupertino_home_scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.radar;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.radar: GlobalKey<NavigatorState>(),
    TabItem.launcher: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.radar: (_) => RadarView(),
      TabItem.launcher: (_) => LauncherView(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}
