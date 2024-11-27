import 'package:bloc/bloc.dart';
import 'package:ee_commerce/features/layouts/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'custom_splash_state.dart';

class CustomSplashCubit extends Cubit<CustomSplashState> {
  CustomSplashCubit(BuildContext context) : super(CustomSplashInitial()){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement( context,MaterialPageRoute(builder: (context) => Home_screen(),) );
    });
  }
}
