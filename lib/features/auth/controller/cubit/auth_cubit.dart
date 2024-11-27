import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ee_commerce/core/consetent/consetent.dart';
import 'package:ee_commerce/core/shared/shared.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    emit(RegisterLoadingState());
    Response response = await http
        .post(Uri.parse("https://student.valuxapps.com/api/register"), body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      //emit success
      emit(RegisterSuccessState());
    } else {
      //emit failed
      emit(FailedToRegisterstate(message: responseBody['message']));
    }
  }

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/login'),
        body: {"email": email, "password": password});
    var data = jsonDecode(response.body);
    if (data['status'] == true) {
      //emit success
     await cache.insertcache(key: 'token', value: data['data']['token']);
      emit(LoginSuccessState());
    } else {
      //emit failed
      emit(FailedToLoginstate(message: data['message']));
    }
  }

  void changePassword({required String currentpassword,required String newpassword })async{
    emit(ChangePasswordLoadingState());
  Response response=await http.post(
    Uri.parse('https://student.valuxapps.com/api/change-password'),
    headers: {
      'Authorization' : token!
    },
    body: {
      'current_password' : currentpassword ,
      'new_password' : newpassword
    }
    );
    var responseBody=jsonDecode(response.body);
    if(responseBody['status']== true){
      emit(ChangePasswordSuccessState(message: responseBody['message'] ));
    }else{
      emit(FailedToChangePasswordstate(erroe: responseBody['message']));
    }
  }
}
