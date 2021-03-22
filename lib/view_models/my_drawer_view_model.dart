import 'package:flutter/services.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/services/app/app.locator.dart';
import 'package:radar_project_app/services/auth.dart';
import 'package:stacked/stacked.dart';

class MyDrawerViewModel extends BaseViewModel{
  final auth=locator<Auth>();

  Future<void> signOut()async{
    try{
      await auth.signOut();
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }

}