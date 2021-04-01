import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar_project_app/helper/common_widgets/network_sensitive.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart';
import 'package:radar_project_app/services/app/app.locator.dart';
import 'package:radar_project_app/view_models/radar_future_view_model.dart';
import 'package:stacked/stacked.dart';

class RadarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Hey radar view build");
    return ViewModelBuilder<RadarFutureViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context,model,child){
        return Center(
          child:model.isBusy?CircularProgressIndicator(backgroundColor: brownColor,):
          model.data==null? Text("No Data"):
          NetworkSensitive(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text('Power',textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: brownColor),),
                GestureDetector(
                    onTap: model.changePower,
                    child: Icon(Icons.power_settings_new,
                      color: model.isEnable?greenColor:Colors.grey,
                      size: 150,)),
                SizedBox(height: 20,),
                Text('Speed: ${(model.speedValue).toInt()} ',textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: brownColor),),
                Slider(
                  value:model.speedValue,
                  min: 0,max: 100,
                  activeColor: greenColor,
                  inactiveColor: Colors.grey,
                  onChanged:(value){
                    model.changeSpeed(value);
                  },
                ),
                SizedBox(height: 20,),
                Text('Angle: ${((model.selectRange.start).toInt())} ,${((model.selectRange.end).toInt())} ',textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: brownColor),),
                RangeSlider(values: model.selectRange,
                    min: 0,max: 180,activeColor: greenColor,
                    inactiveColor: Colors.grey,
                    onChanged:(value){ model.changeAngle(value);}),
                SizedBox(height: 10,),
              ],
            ),
          ) ,
        );
      },
      viewModelBuilder: ()=> locator<RadarFutureViewModel>() ,
    );
  }
}
