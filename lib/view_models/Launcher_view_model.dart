import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/models/launcher_model.dart';
import 'package:radar_project_app/services/firebase_realtime_database_service.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LauncherViewModel  extends BaseViewModel{
  final database = locator<FirebaseRealtimeDatabaseService>();
  final _navigationService=locator<NavigationService>();
  bool _isEnable=false;
  bool get isEnable =>_isEnable;

  Future getData()async{
    try{
      showLoadingDialog();
      LauncherModel result= await database.getLauncherData();
      setPower(result?.launcherPower??false);
      _navigationService.popRepeated(1);
    }catch(e){
      _navigationService.popRepeated(1);
      showErrorDialog(e.message);
    }
  }

  void setPower(bool value){
    _isEnable=value;
    notifyListeners();
  }

  Future<void> changePower() async{
    try{
      _isEnable=!_isEnable;
      await database.setLauncherData(launcherPower: LauncherModel(launcherPower: isEnable));
      notifyListeners();
    }catch(e){
      showErrorDialog(e.message);
    }
  }

}