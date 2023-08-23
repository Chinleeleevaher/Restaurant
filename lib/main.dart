import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/menu_page/menu.dart';
import 'package:myproject/login/Login_Page.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/repository/authen_sipository.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized(); //  <--- here is to make config for change language
  await EasyLocalization.ensureInitialized();  //  <--- here is to make config for change language
  runApp(
    // --- here is of language change 
       EasyLocalization(
      path: 'lib/assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('lo'),
      ],
      fallbackLocale: const Locale('en'),

      //-----of provider------------------
      child: MultiBlocProvider(
        providers: [
           RepositoryProvider(create: (_) => AuthenRepository()),
        ],
        child: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
        ], child: const MyApp()),
      ),
    ),
  );
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
      onGenerateRoute: AppRount.generateRount,
      initialRoute: AppRount.splashScreenPage,
      navigatorKey: NavigationService.navigationKey,
    //-----------of change language -----------------------
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
        locale: context.locale,
    );
  }
}
