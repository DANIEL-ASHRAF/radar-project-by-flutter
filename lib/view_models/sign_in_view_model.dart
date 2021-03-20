import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late String  _email ;
  late String  _password ;

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
//      await navigateAndRemoveUntil(r.LandingRoute.name);
    }on FirebaseAuthException catch(e){
      setBusy(false);
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }finally{
      await navigateAndRemoveUntil(r.LandingRoute.name);
    }
//    catch(e){
//      setBusy(false);
//      showErrorDialog(null);
//    }
  }

  Future<void> signUpWithEmailAndPassword()async {
    try {
      setBusy(true);
      await auth.createUserWithEmailAndPassword(_email, _password);
      setBusy(false);
      await navigateAndRemoveUntil(r.LandingRoute.name);
    }on FirebaseAuthException catch(e){
      setBusy(false);
      showErrorDialog(e.message);
    }catch(e){
      setBusy(false);
      showErrorDialog(null);
    }
  }


  Future<void> navigateToResetPasswordView()async{
    await navigateWithoutAnimation(ResetPasswordView());
  }
}