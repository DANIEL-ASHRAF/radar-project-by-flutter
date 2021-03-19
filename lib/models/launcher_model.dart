import 'package:flutter/material.dart';

class LauncherModel {
  LauncherModel({required this.launcherPower});
  bool? launcherPower;

  factory LauncherModel.fromJson(Map<String, dynamic>? data) {
    if (data == null) {
      return LauncherModel(launcherPower: false);
    }
    return LauncherModel(
      launcherPower: data["launcherPower"],
    );
  }

  Map<String, dynamic> toJson() => {
    "launcherPower": launcherPower,
  };

}