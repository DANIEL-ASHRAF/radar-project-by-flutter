class RadarModel {
RadarModel({
  required this.radarPower,required this.radarSpeed,required this.leftAngle,required this.rightAngle
});
  bool? radarPower;
  int? radarSpeed;
  int? leftAngle;
  int? rightAngle;

factory RadarModel.fromJson(Map<String, dynamic>? data) {
  if (data == null) {
    return RadarModel(radarPower: false, radarSpeed: 0, leftAngle: 0, rightAngle: 180);
  }
  return RadarModel(
      radarPower: data["radarPower"],
      radarSpeed: data["radarSpeed"],
      leftAngle: data["leftAngle"],
      rightAngle: data["rightAngle"],
  );
}

Map<String, dynamic> toJson() => {
  "radarPower": radarPower,
  "radarSpeed": radarSpeed,
  "leftAngle": leftAngle,
  "rightAngle": rightAngle,
  };

}