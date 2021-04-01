import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

  bool validateAndSaveForm(GlobalKey<FormState> key) {
    final myFormKey = key.currentState;
    if (myFormKey!.validate()) {
      myFormKey.save();
      return true;
    }
    return false;
  }

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    MaxLengthValidator(20, errorText: 'Password must be no more than 20 digits long'),
 ]);

  final angleLauncherValidator = MultiValidator([
    RequiredValidator(errorText: 'Angle is required'),
    RangeValidator(min:0,max: 180,errorText: "Angle must be between 0 and 180 degree"),
    PatternValidator(r'^(/^\S*$/)', errorText: "Angle must not have any white space")
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: "Enter a valid email address")
  ]);


