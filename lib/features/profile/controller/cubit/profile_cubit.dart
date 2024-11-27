import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ee_commerce/core/consetent/consetent.dart';
import 'package:ee_commerce/core/global/localization/cubit/lan_cubit.dart';
import 'package:ee_commerce/features/profile/model/user_model.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()){
    Profile();
    LanCubit.getinstance.loadlang();
  }
  User_Model?  userModel;
  void Profile()async{
   Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/profile'),
      headers: {
        'Authorization' : token! 
      }
    );
    var responsedata = jsonDecode(response.body);
    if(responsedata["status"]==true){
     userModel= User_Model.formJson(data: responsedata['data']);
      emit(ProfileSuccess());
    }else{
      emit(ProfileFailed(error: responsedata['message']));
    }
  }
  
   Future<void> convertToArabic() async {
    if (language == 'en') {
      language = 'ar';

      await LanCubit.getinstance.loadlang();
      emit(convertArabic());
    }
  }

  Future<void> convertToEnglish() async {
    if(language == 'ar'){
    language = 'en';
    
    await LanCubit.getinstance.loadlang();
    emit(convertEnglish());
  }}

}
