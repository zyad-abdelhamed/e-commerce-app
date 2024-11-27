import 'package:ee_commerce/core/consetent/consetent.dart';
import 'package:ee_commerce/core/global/localization/cubit/lan_cubit.dart';
import 'package:ee_commerce/core/global/theme/themedata/themedatadark.dart';
import 'package:ee_commerce/core/global/theme/themedata/themedatalight.dart';
import 'package:ee_commerce/core/shared/shared.dart';
import 'package:ee_commerce/features/auth/view/login_page.dart';
import 'package:ee_commerce/features/layouts/view/bottom_nav.dart';
import 'package:ee_commerce/test.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await cache.cacheintialization();
 
 token =  cache.getcache(key: 'token');
 language= cache.getcache(key: 'lang');
  MaterialApp MyApp = MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: getlighttheme,
    // darkTheme:getdarktheme ,
    // themeMode: ThemeMode.system,
    home:token != null && token!="" ? BottomNav() :login_page() ,
  );
  runApp(MyApp);
}
