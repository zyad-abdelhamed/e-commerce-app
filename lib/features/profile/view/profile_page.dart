import 'package:ee_commerce/core/extentions/extention.dart';
import 'package:ee_commerce/features/auth/view/change_password.dart';
import 'package:ee_commerce/features/profile/controller/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Page extends StatelessWidget {
  const Profile_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            final controller=BlocProvider.of<ProfileCubit>(context);
            return controller.userModel != null ?
            Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(radius: 100,
                    child: Icon(Icons.person,size: 150,),),
                Text(controller.userModel!.name!),
                Text(controller.userModel!.email!),
               ElevatedButton(onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(),));
               }, child: Text("chp".lang)),
               ElevatedButton(onPressed: () => controller.convertToArabic(), child: Text('تحويل الى العربى')),
                              ElevatedButton(onPressed: () =>controller.convertToEnglish() , child: Text('change to  en')),

              ],),
            ): Center(child: CircularProgressIndicator(),);
            
          },
        ),
      ),
    );
  }
}
