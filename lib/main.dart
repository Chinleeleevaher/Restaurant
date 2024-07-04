import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/addcategory/provider/categoryProvider.dart';
import 'package:myproject/homepage/addunit/cubit/provider/AdUnitProvider.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/import_Product/provider/provider.dart';
import 'package:myproject/homepage/menu_page/menu.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';
import 'package:myproject/login/Login_Page.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/repository/authen_sipository.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //  <--- here is to make config for change language
  await EasyLocalization
      .ensureInitialized(); //  <--- here is to make config for change language
  runApp(
    // --- here is of change language
    EasyLocalization(
      path: 'lib/assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('lo'),
      ],
      fallbackLocale: const Locale('en'),

      //-----of provider when you create provider you should call it haere------------------
      child: MultiBlocProvider(
        providers: [
          RepositoryProvider(create: (_) => AuthenRepository()),
        ],
        child: MultiProvider(providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => orderprovider()),
          ChangeNotifierProvider(create: (_) => tableProvider()),
          ChangeNotifierProvider(create: (_) => ReportProvider()),
           ChangeNotifierProvider(create: (_) => categoryProvider()),
            ChangeNotifierProvider(create: (_) => UnitProvider()),
            ChangeNotifierProvider(create: (_) => OrderProductProvider()),
            ChangeNotifierProvider(create: (_) => ImpProduct()),
            ChangeNotifierProvider(create: (_) => getUserProvider()),
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
      debugShowCheckedModeBanner: false,
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
