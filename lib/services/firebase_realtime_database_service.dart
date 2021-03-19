import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:radar_project_app/models/launcher_model.dart';
import 'package:radar_project_app/models/radar_model.dart';
import 'package:radar_project_app/services/api_path.dart';

@lazySingleton
class FirebaseRealtimeDatabaseService {

  final databaseReference = FirebaseDatabase.instance.reference();

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try{
      databaseReference.child(path).set(data).asStream();
    }catch(e){
      rethrow;
    }
  }

  Future<void> setRadarData({required RadarModel radarModel})async=> await setData(
    path: APIPath.radarPath(),
    data: radarModel.toJson(),
  );
  Future<void> setLauncherData({required LauncherModel launcherPower})async=> await setData(
    path: APIPath.launcherPath(),
    data: launcherPower.toJson(),
  );
//
//  Future<StreamSubscription<Event>> getRadarStream()async{
//    StreamSubscription<Event> subscription = databaseReference.child(APIPath.radarPath()).onValue.
//    listen((event){RadarModel.fromJson(event.snapshot.value);
//    });
//    return subscription;
//  }

  Future<RadarModel?> getRadarData() async{
    try{
      DataSnapshot dataSnapshot= await databaseReference.child(APIPath.radarPath()).once();
      if(dataSnapshot.value !=null){
        final result;
        result=RadarModel(leftAngle:dataSnapshot.value["leftAngle"],
          radarPower: dataSnapshot.value["radarPower"],
          radarSpeed: dataSnapshot.value["radarSpeed"],
          rightAngle: dataSnapshot.value["rightAngle"],);
        print(result.rightAngle);
        print(result.leftAngle);
        print(result.radarPower);
        print(result);
        return result;
      }
      return null;
    }catch(e){
      rethrow;
    }
  }

  Future<LauncherModel?> getLauncherData() async{
    try{
      DataSnapshot dataSnapshot= await databaseReference.child(APIPath.launcherPath()).once();
      if(dataSnapshot.value !=null){
        LauncherModel result;
        result=LauncherModel(launcherPower: dataSnapshot.value["launcherPower"],);
        print(result);
        return result;
      }
      return null;
    }catch(e){
      rethrow;
    }
  }

}

