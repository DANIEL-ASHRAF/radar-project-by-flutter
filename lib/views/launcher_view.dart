import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:radar_project_app/helper/common_widgets/custom_button.dart';
import 'package:radar_project_app/helper/common_widgets/custom_text_form_field.dart';
import 'package:radar_project_app/helper/common_widgets/network_sensitive.dart';
import 'package:radar_project_app/helper/common_widgets/validators.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart';
import 'package:radar_project_app/helper/ui_helpers.dart';
import 'package:radar_project_app/view_models/launcher_future_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class LauncherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<LauncherFutureViewModel>.reactive(
        builder: (context,model,child) =>Center(
          child:model.isBusy?CircularProgressIndicator(backgroundColor: brownColor,):
          model.data==null? Text("No Data"):
          NetworkSensitive(
            child: _Body(),
          ),
        ),
        viewModelBuilder: ()=> LauncherFutureViewModel());
  }
}

final _myKey = GlobalKey<FormState>();

class _Body extends HookViewModelWidget<LauncherFutureViewModel>{
  _Body({Key? key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
      BuildContext context,
      LauncherFutureViewModel model,
      ) {
    final _angleLauncherTextEditingController=useTextEditingController();
    final _angleLauncherFocusNode=useFocusNode();

    return Form(
      key: _myKey,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          CustomTextFormField(
            contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 10),
            validator: angleLauncherValidator,
            enabled: true,
            keyboardType: TextInputType.number,
            label:"Angle of launcher",
            onSaved: (value)=>model.setLauncherAngle(int.parse(value!)),
            enterPressed: (){
              _angleLauncherFocusNode.unfocus();
            },
            counterTextShow: false,
            labelFontSize: screenWidth(context)*.06,
            fontSize:screenWidth(context)*.06 ,
            textInputAction: TextInputAction.done,
            fillColor: whiteColor,
            labelColor: brownColor,
            cursorColor: brownColor,
            focusBorderColor: brownColor,
            enableBorderColor: brownColor,
            controller: _angleLauncherTextEditingController,
          ),
          SizedBox(height: 20,),
          CustomButton(
            isLoading: model.isBusy,
            iconData:Icons.done,
              onTap: (){
                if(validateAndSaveForm(_myKey)){
                  model.sendData();
                }
              })
        ],
      ),
    );
  }
}
