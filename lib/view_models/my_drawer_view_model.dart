import 'package:flutter/services.dart';
import 'package:radar_project_app/helper/common_widgets/dialog/dialog_type.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/services/auth.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyDrawerViewModel extends BaseViewModel{
  final auth=locator<Auth>();
  final _dialogService= locator<DialogService>();

  Future<void> signOut()async{
    try{
      await auth.signOut();
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }

  Future showThemeDialog()async{
    var response= await _dialogService.showCustomDialog(
      title:"Theme",
      mainButtonTitle: "ok",
      secondaryButtonTitle: "cancel",
      variant:DialogType.Theme ,
    );

    print("CustomResponse : ${response.responseData}");
  }

}