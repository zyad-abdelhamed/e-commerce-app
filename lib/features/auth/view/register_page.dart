import 'package:ee_commerce/features/auth/controller/cubit/auth_cubit.dart';
import 'package:ee_commerce/features/auth/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class register_page extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  register_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login_page(),));
          }else if (state is FailedToRegisterstate){
            showDialog(context: context, builder: (context) => AlertDialog(
              content: Text(state.message),
            ),);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _textfielditem(
                            controller: nameController, hinttext: 'User name'),
                        const SizedBox(
                          height: 20,
                        ),
                        _textfielditem(
                            controller: emailController, hinttext: 'Email'),
                        const SizedBox(
                          height: 20,
                        ),
                        _textfielditem(
                            controller: phoneController, hinttext: 'Phone'),
                        const SizedBox(
                          height: 20,
                        ),
                        _textfielditem(
                            controller: passwordController,
                            hinttext: "Password",
                            secure: true),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text);
                            }
                          },
                          color: Colors.blue,
                          minWidth: double.infinity,
                          child: Text(state is RegisterLoadingState?'loading...' : 'register'),
                        ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  const Text('Have an email?'),
                                  TextButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>login_page() ,));
                                  }, child: const Text('Login'))
                                ],)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _textfielditem(
    {required TextEditingController controller,
    required String hinttext,
    bool secure = false}) {
  return TextFormField(
    controller: controller,
    obscureText: secure,
    validator: (value) {
      if (controller.text.isEmpty) {
        return '$hinttext must not be empty';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      hintText: hinttext,
    ),
  );
}
