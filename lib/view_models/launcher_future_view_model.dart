import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/models/launcher_model.dart';
import 'package:radar_project_app/services/app/app.locator.dart';
import 'package:radar_project_app/services/firebase_realtime_database_service.dart';
import 'package:stacked/stacked.dart';

class LauncherFutureViewModel  extends FutureViewModel<LauncherModel>{
  final database = locator<FirebaseRealtimeDatabaseService>();
  late bool _isEnable;
  bool get isEnable =>_isEnable;
  LauncherModel? result;
  Future<LauncherModel?> getData()async{
    try{
      result= await database.getLauncherData();
      setPower();
      return result;
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }

  void setPower(){
    _isEnable=result?.launcherPower??false;
  }

  Future<void> changePower() async{
    try{
      _isEnable=!_isEnable;
      await database.setLauncherData(launcherPower: LauncherModel(launcherPower: isEnable));
      notifyListeners();
    }on FirebaseException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }

  @override
  Future<LauncherModel?> futureToRun() => getData();

}