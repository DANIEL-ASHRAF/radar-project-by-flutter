import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:radar_project_app/helper/common_widgets/custom_button.dart';
import 'package:radar_project_app/helper/common_widgets/custom_text_form_field.dart';
import 'package:radar_project_app/helper/common_widgets/validators.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart';
import 'package:radar_project_app/helper/ui_helpers.dart';
import 'package:radar_project_app/view_models/sign_in_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';


class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        builder: (context,model,child)=>SafeArea(
          child: Scaffold(
            body: ModalProgressHUD(
              color: brownColor,progressIndicator: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(backgroundColor),
                ),
                inAsyncCall: model.isBusy,
                child: _Body()),
          ),
        ),
        viewModelBuilder: ()=> SignInViewModel());
  }
}

class _Body extends HookViewModelWidget<SignInViewModel> with ValidatorsClass{
  _Body({Key? key}) : super(key: key, reactive: false);

  final _myKey = GlobalKey<FormState>();

  @override
  Widget buildViewModelWidget(
      BuildContext context,
      SignInViewModel model,
      ) {
    final _emailTextEditingController=useTextEditingController();
    final _passwordTextEditingController=useTextEditingController();
    final _emailFocusNode=useFocusNode();
    final _passwordFocusNode=useFocusNode();
    print("partial  rebuild>>>>>>>>>>>>>>>>>>");

    return Form(
      key: _myKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          Container(
            width: screenWidth(context),
            height: screenWidth(context)*.28,
            child: Center(child: Text("Sign in",maxLines: 1,textScaleFactor: 1, style: TextStyle(color: brownColor,fontSize: screenWidth(context)*.12,fontWeight: FontWeight.bold),)),
          ),
          Container(
            padding: EdgeInsets.only(top:12),
            child: CustomTextFormField(
              maxLength: 100,
              counterTextShow: false,
              contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 10),
              fillColor: whiteColor,
              enabled: true,
              controller: _emailTextEditingController,
              labelFontSize: screenWidth(context)*.06,
              fontSize:screenWidth(context)*.06 ,
              cursorColor: brownColor,
              hint: "Email",
              focusBorderColor: brownColor,
              enableBorderColor: brownColor,
              hintColor:brownColor,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocusNode,
              onSaved: (value)=>model.setEmail(value!),
              nextFocusNode: _passwordFocusNode,
              validator: emailValidator,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:12),
            child: CustomTextFormField(
              contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 10),
              enabled: true,
              maxLength: 50,
              hint: "Password",
              controller: _passwordTextEditingController,
              isPassword: true,
              obscureText: true,
              fillColor: whiteColor,
              hintColor: brownColor,
              cursorColor: brownColor,
              labelFontSize: screenWidth(context)*.06,
              fontSize:screenWidth(context)*.06 ,
              focusBorderColor: brownColor,
              enableBorderColor: brownColor,
              iconColor: brownColor,
              onSaved:(value)=> model.setPassword(value!),
              focusNode: _passwordFocusNode,
              textInputAction:TextInputAction.done,
              validator:  passwordValidator,
              enterPressed: (){
                if(validateAndSaveForm(_myKey))
                {
                  model.signInWithEmailAndPassword();
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:16),
            child: CustomButton(
              text: "sign in",
              onTap: (){
                if(validateAndSaveForm(_myKey))
                {
                  model.signInWithEmailAndPassword();
                }
              },
            ),
          ),
          GestureDetector(
            onTap:()async{await model.navigateToResetPasswordView();},
            child: Container(
                padding: EdgeInsets.only(top:16,bottom: 16),
                child: Text("Forget password?",maxLines: 1,textScaleFactor: 1, style: TextStyle(fontSize: screenWidth(context)*.059,color: brownColor,fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}