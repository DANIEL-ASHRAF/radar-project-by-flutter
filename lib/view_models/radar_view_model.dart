import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radar_project_app/helper/common_widgets/dialog/dialog_type.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/models/radar_model.dart';
import 'package:radar_project_app/services/firebase_realtime_database_service.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

//TODO create flag bool which makes us don't set data in the first time we retrieve the data and use it also for color the component
//TODO the radar page render twice when hotRestart

class RadarViewModel extends BaseViewModel{
  final database = locator<FirebaseRealtimeDatabaseService>();
  final _navigationService=locator<NavigationService>();
  bool flag=false;
  bool _isEnable = false;
  double _speedValue=0.0;
  var _selectRange=RangeValues(0,180);
  bool get isEnable =>_isEnable;
  double get speedValue=>_speedValue;
  RangeValues get selectRange =>_selectRange;

  Future getData()async{
    try{
      showLoadingDialog();
      RadarModel? result= await database.getRadarData();
      changeAngle(RangeValues(result?.leftAngle?.toDouble()??0,result?.rightAngle?.toDouble()??0));
      changeSpeed(result?.radarSpeed?.toDouble()??0);
      setPower(result?.radarPower??false);
      flag=true;
      _navigationService.popRepeated(1);
    }on PlatformException catch(e){
      _navigationService.popRepeated(1);
      showErrorDialog(e.message);
    }
  }

  void setPower(bool value){
    _isEnable=value;
    notifyListeners();
  }

  Future<void> changePower()async{
    _isEnable=!_isEnable;
    await sendDataToFirebase();
    notifyListeners();
  }

  Future<void> changeSpeed(double value)async{
    int _speedInInt=value.toInt();
    _speedValue=_speedInInt.toDouble();
    await sendDataToFirebase();
    notifyListeners();
  }

  Future<void> changeAngle(RangeValues value)async{
    _selectRange=RangeValues((value.start.toInt()).toDouble(),(value.end.toInt()).toDouble());
    await sendDataToFirebase();
    notifyListeners();
  }

  Future<void> sendDataToFirebase()async{
    setBusy(true);
    try{
      if(flag){
        await database.setRadarData(
            radarModel: RadarModel(
                radarPower: isEnable,
                radarSpeed: speedValue.toInt(),
                leftAngle: selectRange.start.toInt(),
                rightAngle: selectRange.end.toInt()));
      }
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
//    setBusy(false);
  }

}