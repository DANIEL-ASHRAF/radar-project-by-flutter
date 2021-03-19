import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesService{

  Future<void> setThemeStyle(int themeIndex)async{
    final prefs= await SharedPreferences.getInstance();
    await prefs.setInt('themeStyle', themeIndex);
  }
  Future getThemeStyle()async{
    final prefs= await SharedPreferences.getInstance();
    final themeStyle =prefs.getInt('themeStyle');
    if(themeStyle == null){
       return 1;
    }
    return themeStyle;
  }

}