import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart' ;
import 'package:radar_project_app/helper/ui_helpers.dart';
import 'package:radar_project_app/home/tab_item.dart';
import 'package:radar_project_app/views/my_drawer_view.dart';
class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold({
    Key key,
    @required this.currentTab,
    @required this.onSelectTab,
    @required this.widgetBuilders,
    @required this.navigatorKeys,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          backgroundColor: backgroundColor,elevation: 0,
          leadingWidth: 30,
          leading: Builder(
            builder: (context)=>GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomRight:Radius.circular(20)),color: brownColor),
                  child: Stack(
                    children: [
                      Positioned(
                          left: -15,
                          child: Icon(Icons.arrow_right,size: 55,color: backgroundColor,)),
                    ],
                  )),
            ),
          ),
        ),
        drawer: MyDrawerView(),
        body:CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor:bottomTabBarColor,
            items: [
              _buildItem(TabItem.radar,context),
              _buildItem(TabItem.launcher,context),
            ],
            onTap: (index) => onSelectTab(TabItem.values[index]),
          ),
          tabBuilder: (context, index) {
            final item = TabItem.values[index];
            return CupertinoTabView(
              navigatorKey: navigatorKeys[item],
              builder: (context) => widgetBuilders[item](context),
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem,BuildContext context) {
    final itemData = TabItemData.allTabs[tabItem];
    final textColor = currentTab == tabItem ? greenColor : greyColor;
    final imageColor = currentTab == tabItem ? true : false;

    return BottomNavigationBarItem(
      icon: itemData.title=="Launcher"?
      Container(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              itemData.title,textScaleFactor: 1,
              style: TextStyle(color: textColor,fontSize: screenWidth(context)*.066,fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5,),
            Image( image:imageColor? itemData.imageOn:itemData.imageOff ,
              height:screenWidth(context)*.082 ,
              width: screenWidth(context)*.082 ,
            ),
          ],
        ),
      ):
      Container(
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color:brownColor,width: 2))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              itemData.title,textScaleFactor: 1,
              style: TextStyle(color: textColor,fontSize:screenWidth(context)*.066,fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5,),
            Image( image:imageColor? itemData.imageOn:itemData.imageOff ,
              height:screenWidth(context)*.082 ,
              width: screenWidth(context)*.082 ,
            ),
          ],
        ),
      ),
    );
  }
}
