import 'package:firebase_auth/firebase_auth.dart';
import 'package:radar_project_app/helper/constants/methods.dart';
import 'package:radar_project_app/services/app/app.locator.dart';
import 'package:radar_project_app/services/app/app.router.dart';
import 'package:radar_project_app/services/auth.dart';
import 'package:radar_project_app/views/reset_password_view.dart';
import 'package:stacked/stacked.dart';

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

  Future<void> signInWithEmailAndPassword()async {
    try {
      setBusy(true);
      await auth.signInWithEmailAndPassword(_email, _password);
      setBusy(false);
    }on FirebaseAuthException catch(e){
      setBusy(false);
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }finally{
      await navigateAndRemoveUntil(Routes.landingPage);
    }
  }

  Future<void> navigateToResetPasswordView()async{
    await navigateWithoutAnimation(ResetPasswordView());
  }
}