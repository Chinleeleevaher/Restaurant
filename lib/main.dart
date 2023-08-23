import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/menu.dart';
import 'package:myproject/login/Login_Page.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //     ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      //   //useMaterial3: true,
      // ),
      home: BlocProvider(
        create: (context) => CubitCubit(
            //this below line is to access the
            homeProvider: context.read<UserProvider>()),
        child: Menu(),
      ),
    );
  }
}
