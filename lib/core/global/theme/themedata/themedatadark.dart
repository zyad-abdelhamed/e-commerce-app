import 'package:ee_commerce/core/global/theme/themedataconsts/themadatadarkconst.dart';
import 'package:flutter/material.dart';

ThemeData getdarktheme= ThemeData.dark().copyWith(
   appBarTheme: const AppBarTheme(
    color:Darkconsts.appBarColor,
    centerTitle: Darkconsts.centerTitle
  ),
  /////////////////////////
  elevatedButtonTheme:const ElevatedButtonThemeData(
   style: ButtonStyle(
    backgroundColor:MaterialStatePropertyAll(Darkconsts.elevatedcolor)
   )
  ),
  ////////////////////////
  textTheme:const TextTheme(
    displayLarge: TextStyle(fontWeight: Darkconsts.textweight,fontSize: Darkconsts.textsizelarge),
    displayMedium: TextStyle(fontSize: Darkconsts.textsizemedium),
    displaySmall: TextStyle(fontSize: Darkconsts.textsizesmall),
  ),
  ///////////////////////////////////////////
  iconTheme:const IconThemeData(
    color:Darkconsts.iconcolor ,
    size: Darkconsts.iconsize
  )
);