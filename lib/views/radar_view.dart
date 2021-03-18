import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart';
import 'package:radar_project_app/view_models/radar_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class RadarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RadarViewModel>.reactive(
      builder: (context,model,child){
        return SafeArea(
          child: Scaffold(
            body: _Body(),
          ),
        );
      },
      viewModelBuilder: ()=> RadarViewModel() ,
    );
  }
}
class _Body extends HookViewModelWidget<RadarViewModel> {
  _Body({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, RadarViewModel model) {
    // ignore: missing_return
    useEffect((){ Future.microtask((){ model.getData();});
    },const[]);
    return Center(
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
//                    Text('Speed: ${(snap).toInt()} ',textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: brownColor),),

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
      ) ,
    );
  }
}
