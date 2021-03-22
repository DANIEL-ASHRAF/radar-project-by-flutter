import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/models/radar_model.dart';
import 'package:radar_project_app/services/app/app.locator.dart';
import 'package:radar_project_app/services/firebase_realtime_database_service.dart';
import 'package:stacked/stacked.dart';

class RadarFutureViewModel extends FutureViewModel<RadarModel>{
  final database = locator<FirebaseRealtimeDatabaseService>();
  late bool _isEnable;
  late double _speedValue;
  late RangeValues _selectRange;
  bool get isEnable =>_isEnable;
  double get speedValue=>_speedValue;
  RangeValues get selectRange =>_selectRange;
  RadarModel? result;
  Future<RadarModel?> getData()async{
    try{
      result= await database.getRadarData();
      setAngle(RangeValues(result?.leftAngle?.toDouble()??0,result?.rightAngle?.toDouble()??0));
      setSpeed(result?.radarSpeed?.toDouble()??0);
      setPower(result?.radarPower??false);
      return result;
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }

  void setPower(bool value){
    _isEnable=value;
  }
  void setSpeed(double value){
    int _speedInInt=value.toInt();
    _speedValue=_speedInInt.toDouble();
  }
  void setAngle(RangeValues value){
    _selectRange=RangeValues((value.start.toInt()).toDouble(),(value.end.toInt()).toDouble());
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
    try{
        await database.setRadarData(
            radarModel: RadarModel(
                radarPower: isEnable,
                radarSpeed: speedValue.toInt(),
                leftAngle: selectRange.start.toInt(),
                rightAngle: selectRange.end.toInt()));
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }

  @override
  Future<RadarModel?> futureToRun() =>getData();
}