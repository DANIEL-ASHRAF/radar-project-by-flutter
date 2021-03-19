import 'package:radar_project_app/helper/common_widgets/dialog/dialog_type.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DialogViewModel extends BaseViewModel{
  final _dialogService= locator<DialogService>();
  late bool _confirmationResult;
  bool get confirmationResult =>_confirmationResult;
  late DialogResponse _dialogResponse;
  DialogResponse get customDialogResult => _dialogResponse;

  Future showBasicDialog()async{
    DialogResponse response= await _dialogService.showDialog(
      title:"Hello !!!",
      description: "It's me ...",
      buttonTitle: "ok",
      cancelTitle: "cancel",
    );
    print("DialogResponse : ${response.confirmed}");
    //true , false , null(when dismiss th dialog )
  }

  Future showConfirmationDialog()async{
    var response= await _dialogService.showConfirmationDialog(
      title:"Hello !!!",
      description: "It's me ...",
      confirmationTitle: "yes",
      cancelTitle: "cancel",
    );
    _confirmationResult=response.confirmed!;
    notifyListeners();
  }

  Future showCustomDialog()async{
    var response= await _dialogService.showCustomDialog(
      title:"Enter your password",
      mainButtonTitle: "confirm",
      variant:DialogType.Form ,
    );
    print("CustomResponse : ${response.responseData}");
  }

  Future showLoadingDialog()async{
   await _dialogService.showCustomDialog();
  }
}