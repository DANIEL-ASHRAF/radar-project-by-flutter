import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:radar_project_app/helper/common_widgets/custom_button.dart';
import 'package:radar_project_app/helper/common_widgets/custom_text_form_field.dart';
import 'package:radar_project_app/helper/common_widgets/validators.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart';
import 'package:radar_project_app/helper/ui_helpers.dart';
import 'package:radar_project_app/view_models/reset_password_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ResetPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
        builder: (context,model,_)=>SafeArea(
          child: Scaffold(
            body: ModalProgressHUD(
                inAsyncCall: model.isBusy,
                child: _Body()),
          ),
        ),
        viewModelBuilder: ()=>ResetPasswordViewModel());
  }
}
 class _Body extends HookViewModelWidget<ResetPasswordViewModel>{
   _Body({Key? key}) : super(key: key, reactive: false);

   final _myKey = GlobalKey<FormState>();

   @override
   Widget buildViewModelWidget(
       BuildContext context,
       ResetPasswordViewModel model,
       ) {
     final _emailTextEditingController=useTextEditingController();
     final _resetFocusNode=useFocusNode();

     return Form(
       key: _myKey,
       child: ListView(
         padding: EdgeInsets.symmetric(horizontal: 12),
         children: <Widget>[
           Container(
             width: screenWidth(context),
             height: screenWidth(context)*.28,
             child: Center(child: Text("Reset Password",textScaleFactor: 1, maxLines: 1,style: TextStyle(color: brownColor,fontSize: screenWidth(context)*.12,fontWeight: FontWeight.bold),)),
           ),
           Container(
             padding: EdgeInsets.only(top:12),
             child: CustomTextFormField(
               maxLength: 100,
               counterTextShow: false,
               contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 10),
               enabled: true,
               controller: _emailTextEditingController,
               labelFontSize: screenWidth(context)*.06,
               fontSize:screenWidth(context)*.06 ,
               hint: "Email",
               fillColor: whiteColor,
               hintColor: brownColor,
               cursorColor: brownColor,
               focusBorderColor: brownColor,
               enableBorderColor: brownColor,
               keyboardType: TextInputType.emailAddress,
               focusNode: _resetFocusNode,
               textInputAction: TextInputAction.done,
               onSaved: (value)=>model.setEmail(value),
               enterPressed: (){
                 if(validateAndSaveForm(_myKey)){
                   model.sendPasswordResetEmail();
                 }
               },
               validator: emailValidator,
             ),
           ),
           Container(
             padding: EdgeInsets.only(top:16),
             child: CustomButton(
               text: "Done",
               onTap: (){
                 if(validateAndSaveForm(_myKey)){
                   model.sendPasswordResetEmail();
                 }
               },
             ),
           ),
         ],
       ),
     );
   }
 }

//
//class ResetPasswordPage extends StatefulWidget with ValidatorsClass {
//  @override
//  _ResetPasswordPageState createState() => _ResetPasswordPageState();
//}
//
//class _ResetPasswordPageState extends State<ResetPasswordPage> {
//  bool isBusy = false;
//  GlobalKey _myKey = GlobalKey<FormState> ();
//  String _email;
//  FocusNode _emailFocusNode = FocusNode();
////TODO اوحد حجم الخطوط   normaltextsize = 22 ,,, smalltextsize = .....
//  Future<void> _sendPasswordResetEmail() async {
//    setState(() {
//      isBusy = true;
//    });
//    try {
//      await widget.auth.sendPasswordResetEmail(_email);
//      if(mounted){
//        setState(() {
//          isBusy = false;
//        });
//      }
//      APlatformAlertDialog(
//        defaultActionText: "موافق",
//        title: "تنبيه هام",
//        content: "سوف يتم ارسال رابط لكتابة كلمة السر الجديدة خلال 5 دقائق",
//        ).show(context).whenComplete(() => beginScreen(context, SignInPage.create(context))
//      );
//    } on PlatformException catch (e) {
//      setState(() {
//        isBusy = false;
//      });
//      PlatformExceptionAlertDialog(
//        title: 'Sign in failed',
//        exception: e,
//      ).show(context);
//    }
//  }
//
//  @override
//  void dispose() {
//    _emailFocusNode.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ModalProgressHUD(
//      inAsyncCall: isBusy,
//      child: SafeArea(
//        child: Scaffold(
//          backgroundColor: backgroundColor,
//          body:Form(
//            key: _myKey,
//            child: ListView(
//              padding: EdgeInsets.symmetric(horizontal: 12),
//              children: <Widget>[
//                Container(
//                  width: screenWidth(context),
//                  height: screenWidth(context)*.28,
//                  child: Center(child: Text("نسيت كلمة السر",textScaleFactor: 1, maxLines: 1,style: TextStyle(color: googleColor,fontSize: screenWidth(context)*.12,fontWeight: FontWeight.bold),)),
//                ),
//                Container(
//                  padding: EdgeInsets.only(top:12),
//                  child: CustomTextFormField(
//                    maxLength: 80,
//                    counterTextShow: false,
//                    contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 10),
//                    enabled: !isBusy,
//                    labelFontSize: screenWidth(context)*.06,
//                    fontSize:screenWidth(context)*.06 ,
//                    hint: "Email",
//                    fillColor: fillColor,
//                    hintColor: hintColor,
//                    cursorColor: cursorColor,
//                    focusBorderColor: focusBorderColor,
//                    enableBorderColor: enableBorderColor,
//                    keyboardType: TextInputType.emailAddress,
//                    focusNode: _emailFocusNode,
//                    textInputAction: TextInputAction.done,
//                    onSaved: (value)=>_email=value,
//                    enterPressed: (){
//                      if(widget.validateAndSaveForm(_myKey)){
//                        _sendPasswordResetEmail();
//                      }
//                    },
//                    validator: widget.emailValidator,
//                  ),
//                ),
//                Container(
//                  padding: EdgeInsets.only(top:16),
//                  child: CustomButton(
//                    text: "تم",
//                    onTap: (){
//                      if(widget.validateAndSaveForm(_myKey)){
//                        _sendPasswordResetEmail();
//                      }
//                    },
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
