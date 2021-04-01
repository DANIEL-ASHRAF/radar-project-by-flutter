class LauncherModel {
  LauncherModel({required this.launcherAngle});
  int? launcherAngle;

  factory LauncherModel.fromJson(Map<String, dynamic>? data) {
    if (data == null) {
      return LauncherModel(launcherAngle: 0);
    }
    return LauncherModel(
      launcherAngle: data["launcherAngle"],
    );
  }

  Map<String, dynamic> toJson() => {
    "launcherAngle": launcherAngle,
  };

}