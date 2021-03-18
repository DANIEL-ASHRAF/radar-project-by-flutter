
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:radar_project_app/helper/constants/app_colors.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dialog_type.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();

  var builders={
    DialogType.Loading:(BuildContext context,DialogRequest dialogRequest,
        Function(DialogResponse) completer)=>
        Dialog(
          child: _LoadingDialog(),
        ),
    DialogType.Form:(BuildContext context,DialogRequest dialogRequest,
    Function(DialogResponse) completer)=>
        Dialog(
          child: _FormCustomDialog(dialogRequest: dialogRequest,onDialogTap: completer,),
        ),
    DialogType.Theme:(BuildContext context,DialogRequest dialogRequest,
        Function(DialogResponse) completer)=>
        Dialog(
          child: _ThemeCustomDialog(dialogRequest: dialogRequest,onDialogTap: completer,),
        ),
    DialogType.Basic:(BuildContext context,DialogRequest dialogRequest,
        Function(DialogResponse) completer)=>
        Dialog(
          child: _BasicCustomDialog(
            dialogRequest: dialogRequest,
            onDialogTap: completer,
          ),
        ),
  };
  dialogService.registerCustomDialogBuilders(builders);
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({Key key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "loading ...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ],
      ),
    );
  }
}


class _BasicCustomDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _BasicCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            dialogRequest.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dialogRequest.description,
            style: TextStyle(fontSize: 18),
//            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => onDialogTap(DialogResponse(confirmed: true)),
            child: Container(
              child: dialogRequest.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle,style: TextStyle(color: backgroundColor,fontWeight: FontWeight.bold),),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: brownColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ThemeCustomDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _ThemeCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var radioSelect=useState(1);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Theme",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,color: brownColor),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Radio(
                activeColor: brownColor,
                value: 1,
                groupValue: radioSelect.value,
                onChanged: (value)=>{radioSelect.value=value},
              ),
              Text(
                "Normal theme",
                style: TextStyle(fontSize: 18,color: brownColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                activeColor: brownColor,
                value: 2,
                groupValue: radioSelect.value,
                onChanged: (value)=>{radioSelect.value=value},
              ),
              Text(
                "Dark theme",
                style: TextStyle(fontSize: 18,color: brownColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => onDialogTap(DialogResponse(responseData: false)),
                child:Text(dialogRequest.secondaryButtonTitle,style: TextStyle(color: brownColor,fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              SizedBox(width: 25,),
              GestureDetector(
                onTap: () => onDialogTap(DialogResponse(responseData: radioSelect.value)),
                child:Text(dialogRequest.mainButtonTitle,style: TextStyle(color: brownColor,fontWeight: FontWeight.bold,fontSize: 18)),
              ),
            ],
          )
        ],
      ),
    );
  }
}


class _FormCustomDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _FormCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useTextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            dialogRequest.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () =>
                onDialogTap(DialogResponse(responseData: [controller.text])),
            child: Container(
              child: dialogRequest.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}