import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class cache{
  static late SharedPreferences sharedPreferences;
  static cacheintialization()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }
  static Future<bool>  insertcache ({required String key,required String value})async{
    return await sharedPreferences.setString(key, value);
  }
  static String getcache({required String key}){
    return sharedPreferences.getString(key) ?? "" ;
  }
  static Future<bool> deletecache({required String key})async{
   return await sharedPreferences.remove(key);
  }
}