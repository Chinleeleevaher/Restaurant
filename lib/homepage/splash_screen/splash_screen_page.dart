import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/splash_screen/cubit/splash_screen_cubit.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        return const AnnotatedRegion<SystemUiOverlayStyle>(
          //----- here is to make AppBar color---------
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.red,
            // statusBarIconBrightness: Brightness.dark,
            // statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading...'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
