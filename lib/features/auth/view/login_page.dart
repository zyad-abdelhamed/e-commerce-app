import 'package:ee_commerce/features/auth/controller/cubit/auth_cubit.dart';
import 'package:ee_commerce/features/auth/view/register_page.dart';
import 'package:ee_commerce/features/layouts/view/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class login_page extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  BottomNav(),
                ));
          } else if (state is FailedToLoginstate) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                const Image(image: AssetImage('assets/login.jpg')),
                Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          alignment: Alignment.bottomCenter,
                          child: const Text(
                            'Login to continue process',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: const BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 30),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: email,
                                  validator: (value) {
                                    if (email.text.isEmpty) {
                                      return 'email must not be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'email',
                                      icon: Icon(Icons.email)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: password,
                                  validator: (value) {
                                    if (password.text.isEmpty) {
                                      return 'password must not be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: 'password',
                                      icon: Icon(Icons.password)),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  color: Colors.black,
                                  minWidth: double.infinity,
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      BlocProvider.of<AuthCubit>(context).login(
                                          email: email.text,
                                          password: password.text);
                                    }
                                  },
                                  child: Text(
                                    state is LoginLoadingState
                                        ? "loading..."
                                        : 'Login',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ), const SizedBox(
                                  height: 10,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  const Text('Not have an email?'),
                                  TextButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>register_page() ,));
                                  }, child: const Text('Sign in'))
                                ],)

                              ],
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
