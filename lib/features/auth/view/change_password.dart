import 'package:ee_commerce/features/auth/controller/cubit/auth_cubit.dart';
import 'package:ee_commerce/features/profile/view/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final currentpassword = TextEditingController();
    final newpassword = TextEditingController();
    final formkey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
             
            ));
             Navigator.push(context, MaterialPageRoute(builder: (context) => Profile_Page() ));
          }
           if (state is FailedToChangePasswordstate) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.erroe),
               backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.lightBlue,
                title: const Text(
                  'Change Password',
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Form(
                      key: formkey,
                      child: TextFormField(
                        controller: currentpassword,
                        validator: (value) {
                          if (currentpassword.text.isEmpty) {
                            return 'Must not be empty';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Current password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: newpassword,
                      validator: (value) {
                        if (newpassword.text.isEmpty) {
                          return 'Must not be empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'New password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          cubit.changePassword(
                              currentpassword: currentpassword.text,
                              newpassword: newpassword.text);
                             
                        }
                      },
                      child:  Text(state is ChangePasswordLoadingState?'loading....' :'Update'),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
