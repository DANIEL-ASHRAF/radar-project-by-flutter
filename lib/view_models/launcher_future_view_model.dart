import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/models/launcher_model.dart';
import 'package:radar_project_app/services/app/app.locator.dart';
import 'package:radar_project_app/services/firebase_realtime_database_service.dart';
import 'package:stacked/stacked.dart';

class LauncherFutureViewModel  extends FutureViewModel<LauncherModel>{
  final database = locator<FirebaseRealtimeDatabaseService>();
  late int _launcherAngle;
  int get launcherAngle =>_launcherAngle;
  LauncherModel? result;
  Future<LauncherModel?> getData()async{
    try{
      result= await database.getLauncherData();
      setLauncherAngle(result?.launcherAngle??0);
      return result;
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }

  void setLauncherAngle(int value){
    _launcherAngle=value;
  }

  Future<void> sendData() async{
    try{
      setBusy(true);
      await database.setLauncherData(launcherModel: LauncherModel(launcherAngle: _launcherAngle));
      setBusy(false);
      notifyListeners();
    }on FirebaseException catch(e){
      setBusy(false);
      showErrorDialog(e.message);
    }catch(e){
      setBusy(false);
      showErrorDialog(null);
    }
  }

  @override
  Future<LauncherModel?> futureToRun() => getData();

}