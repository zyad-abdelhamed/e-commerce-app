import 'package:ee_commerce/core/global/theme/themedataconsts/themedatalightconst.dart';
import 'package:flutter/material.dart';

ThemeData getlighttheme= ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    color:Lightconsts.appBarColor,
    centerTitle: Lightconsts.centerTitle
  ),
  /////////////////////////
  elevatedButtonTheme:const ElevatedButtonThemeData(
   style: ButtonStyle(
    backgroundColor:MaterialStatePropertyAll(Lightconsts.elevatedcolor)
   )
  ),
  ////////////////////////
  textTheme:const TextTheme(
    displayLarge: TextStyle(fontWeight: Lightconsts.textweight,fontSize: Lightconsts.textsizelarge),
    displayMedium: TextStyle(fontSize: Lightconsts.textsizemedium),
    displaySmall: TextStyle(fontSize: Lightconsts.textsizesmall),
  ),
  ///////////////////////////////////////////
  iconTheme:const IconThemeData(
    color:Lightconsts.iconcolor ,
    size: Lightconsts.iconsize
  )
);