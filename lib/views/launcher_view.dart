import 'package:flutter/material.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart';
import 'package:radar_project_app/view_models/launcher_future_view_model.dart';
import 'package:stacked/stacked.dart';

class LauncherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Hey launcher view build");
    return ViewModelBuilder<LauncherFutureViewModel>.reactive(
        builder: (context,model,child) =>Scaffold(
          body:  SafeArea(
            child:Center(
              child:model.isBusy?CircularProgressIndicator(backgroundColor: brownColor,):
              model.data==null? Text("No Data"):
              ListView(
                shrinkWrap: true,
                children: [
                  Text('Power',textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: brownColor),),
                  GestureDetector(
                      onTap:()async => await model.changePower(),
                      child: Icon(Icons.power_settings_new,
                        color: model.isEnable?greenColor:Colors.grey,
                        size: 150,)),
                  SizedBox(height: 30,),

                ],
              ),
            ),
          )
        ),
        viewModelBuilder: ()=> LauncherFutureViewModel());
  }
}


