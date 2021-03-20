import 'package:flutter/material.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart';
import 'package:radar_project_app/helper/ui_helpers.dart';
import 'package:radar_project_app/view_models/my_drawer_view_model.dart';
import 'package:stacked/stacked.dart';

class MyDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyDrawerViewModel>.nonReactive(
        builder: (context,model,_)=>ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          child: Container(
            width: screenWidth(context)*.65,
            child: Drawer(
              child: Container(
                color: backgroundColor,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    Container(child: Column(
                      children: [
                        Container(
                          height: 125,
                            child: Image(image: AssetImage("assets/radar_on.png"),fit: BoxFit.contain,)),
                        Text("Radar project",maxLines: 1,textScaleFactor: 1,  style: TextStyle(
                            fontSize: screenWidth(context)*.09,
                            fontWeight: FontWeight.bold,
                            color: brownColor),),
                      ],
                    )),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(
                        color: brownColor,
                        thickness: 3,
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){ },
                      child: Row(children: [
                        Icon(Icons.people,color: brownColor,size:screenWidth(context)*.08),
                        SizedBox(width: 20,),
                        Text("project team",maxLines: 1,textScaleFactor: 1.0,  style: TextStyle(
                            fontSize: screenWidth(context)*.066,
                            fontWeight: FontWeight.bold,color: brownColor),),
                      ],),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(
                        color: brownColor,
                        thickness: 3,
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: model.signOut,
                      child: Row(children: [
                        Icon(Icons.exit_to_app,color: brownColor,size: screenWidth(context)*.08),
                        SizedBox(width: 20,),
                        Text("sign out",maxLines: 1,textScaleFactor: 1,  style: TextStyle(
                            fontSize: screenWidth(context)*.066,
                            fontWeight: FontWeight.bold,
                            color: brownColor),),
                      ],),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        viewModelBuilder: ()=>MyDrawerViewModel());
  }
}
