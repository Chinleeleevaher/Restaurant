import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/addproduct/addproduct_page.dart';
import 'package:myproject/homepage/addproduct/cubit/addproduct_cubit.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/menu_page/cubit/menu_cubit.dart';
import 'package:myproject/homepage/menu_page/menu.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/product_page/cubit/products_cubit.dart';
import 'package:myproject/homepage/product_page/product_page.dart';
import 'package:myproject/homepage/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:myproject/homepage/splash_screen/splash_screen_page.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:myproject/homepage/table_page/table_page.dart';
import 'package:myproject/login/Login_Page.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/repository/authen_sipository.dart';
import 'package:myproject/signin/Sign_page.dart';
import 'package:myproject/signin/cubit/sign_in_cubit.dart';

class AppRount {
  static const String splashScreenPage = '/splashScreenPage';
  static const String loginpage = '/Login_page';
  static const String signinpage = '/SignIn_Page';
  static const String homepage = '/Homepahe';
  static const String menupage = '/Menu';
  static const String tabletype = '/tabletype';
  static const String product = '/Product';
  static const String addproduct = '/Addproduct';

  static Route<dynamic> generateRount(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashScreenCubit(
              homeProvider: context.read<UserProvider>(),
            )..validateToken(),
            child: const SplashScreenPage(),
          ),
        );
      case loginpage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CubitCubit(
              context: context,
              homeProvider: context.read<UserProvider>(),
            ),
            child: Login_page(),
          ),
        );
      case signinpage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignInCubit(),
            child: SignIn_Page(),
          ),
        );
      case menupage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MenuCubit()
              ..getProductTypes()
              ..getproduct(), // <---here is mean to access to two fucntion in the cubit

            child: Menu(),
          ),
        );
      case homepage:
        return MaterialPageRoute(
          builder: (context) => Homepage(),
        );
      case tabletype:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => TabletypeCubit(
                authenRepository: context.read<AuthenRepository>())
              ..getTabletypes()
              ..getTables(), // <---here is mean to access to two fucntion in the cubit
            child: Table_page(),
          ),
        );
      case product:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProductsCubit(
                authenRepositorys: context.read<AuthenRepository>())
              ..producttypelist()
              ..unitlist()
              ..getproduct(), // <---here is mean to access to two fucntion in the cubit
            child: ProductPage(),
          ),
        );

      case addproduct:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AddproductCubit(
              authenRepositorys: context.read<AuthenRepository>(),
              productmodel: settings.arguments as ProductModel?, // <---here is to make send arguments from ProductModel to the addproduct page to make update
            )
              ..producttypelist(),
              // ..unitlist()
              // ..initialDataForm(), // <---here is mean to access to two fucntion in the cubit
            child: Addproduct(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const DefaulPage());
    }
  }
}

class DefaulPage extends StatelessWidget {
  const DefaulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No found page'),
      ),
    );
  }
}
