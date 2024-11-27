import 'package:ee_commerce/features/custom%20splash%20screen/controller/cubit/custom_splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Custom_splash extends StatelessWidget {
  const Custom_splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CustomSplashCubit(context),
        child: BlocBuilder<CustomSplashCubit, CustomSplashState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/spalsh.jpg')),
                  Text(
                    'Created by Soliman Esam',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
