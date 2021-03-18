import 'package:flutter/material.dart';
import 'package:radar_project_app/helper/common_widgets/dialog/dialog_view_model.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/landing_page.dart';
import 'package:radar_project_app/services/auth.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:radar_project_app/services/routes/router.gr.dart'as r;
import 'package:radar_project_app/views/reset_password_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel {
  Auth auth=locator<Auth>();

  DialogViewModel dialogViewModel;
  String  _email ;
  String  _password ;

  void setEmail(String value){
    _email=value;
  }
  void setPassword(String value){
    _password=value;
  }

  //TODO handle exception & set busy

  Future<void> signInWithEmailAndPassword()async {
    try {
      setBusy(true);
      await auth.signInWithEmailAndPassword(_email, _password);
      setBusy(false);
      await navigateAndRemoveUntil(r.Router.landingPage);
    } catch (e) {
      setBusy(false);
      showErrorDialog(e.message);
    }
  }

  Future<void> navigateToResetPasswordView()async{
    await navigateWithoutAnimation(ResetPasswordView());
  }
}