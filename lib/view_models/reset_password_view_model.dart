import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:radar_project_app/helper/common_widgets/validators.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/services/auth.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:radar_project_app/views/sign_in_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResetPasswordViewModel extends BaseViewModel {
  Auth auth=locator<Auth>();

  late String _email;

  void setEmail(String? value){
    _email=value!;
  }

  Future<void> sendPasswordResetEmail() async {

    try {
      setBusy(true);
      await auth.sendPasswordResetEmail(_email);
      setBusy(false);
      await navigateWithoutAnimation(SignInView());
     }on FirebaseAuthException catch(e){
      setBusy(false);
      showErrorDialog(e.message);
     }catch(e){
      setBusy(false);
      showErrorDialog(null);
    }
  }

}
