import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ee_commerce/core/consetent/consetent.dart';
import 'package:ee_commerce/core/shared/shared.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'lan_state.dart';

class LanCubit extends Cubit<LanState> {
  LanCubit._() : super(LanInitial()) {
    loadlang();
  }
  
  static  LanCubit? _instance  ;
  static Object soli = Object();
  static LanCubit get getinstance{
    _instance ??= LanCubit._();
    // if(_instance == null){
    //   // lock(soli){
    //   //    _instance ??= LanCubit._();
    //   // }
    // }
   
    //  if(_instance == null){
    //   _instance = LanCubit._();
    // }
    return _instance!;
 } 
 ////////////////////////////////////////////////////////////////
 

  Map<String, dynamic> localization = {};
  Future<void> loadlang() async {
    await cache.insertcache(key: 'lang', value: language);
    String root = await rootBundle.loadString("assets/lang/$language.json");
    localization = json.decode(root);
    emit(LanInitial());
  }

///////////////////////////////////////////////////////////////////
  
  //  Future<void> convertToArabic() async {
  //   if (language == 'en') {
  //     language = 'ar';

  //     await loadlang();
  //     emit(convertArabic());
  //   }
  // }

  // Future<void> convertToEnglish() async {
  //   if(language == 'ar'){
  //   language = 'en';
    
  //   await loadlang();
  //   emit(convertEnglish());
  // }}

  bool isarabic() {
    return language == 'ar';
  }
}
class lo {
  
}