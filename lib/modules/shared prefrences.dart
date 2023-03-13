import 'package:shared_preferences/shared_preferences.dart';
class shareprefrence{
  static SharedPreferences? shared= null ;
  static inite() async{
    shared = await SharedPreferences.getInstance();
  }
  static Future<bool> putdata({required String key,required bool value})
  async{
   return shared!.setBool(key,value );
  }

  static bool? getdata({required String key})
  {
    return shared!.getBool(key);
  }
}