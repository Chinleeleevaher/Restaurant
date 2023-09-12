import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/addproduct/addproduct_page.dart';
import 'package:myproject/homepage/addproduct/cubit/addproduct_cubit.dart';
import 'package:myproject/homepage/check_bill/checkbill_page.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/menu_page/cubit/menu_cubit.dart';
import 'package:myproject/homepage/menu_page/menu.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/order/cubit/lisproduct_cubit.dart';
import 'package:myproject/homepage/order/listproduct_page.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_history/cubit/orderstatus_cubit.dart';
import 'package:myproject/homepage/order_history/order_status_page.dart';
import 'package:myproject/homepage/order_list/cubit/order_cubit.dart';
import 'package:myproject/homepage/order_list/orderlist_page.dart';
import 'package:myproject/homepage/product_page/cubit/products_cubit.dart';
import 'package:myproject/homepage/product_page/product_page.dart';
import 'package:myproject/homepage/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:myproject/homepage/splash_screen/splash_screen_page.dart';
import 'package:myproject/homepage/table_change/cubit/chang_table_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:myproject/homepage/table_page/table_page.dart';
import 'package:myproject/login/Login_Page.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/provider/ProductProvider.dart';
import 'package:myproject/repository/authen_sipository.dart';
import 'package:myproject/signin/Sign_page.dart';
import 'package:myproject/signin/cubit/sign_in_cubit.dart';

import '../homepage/check_bill/cubit/checkbill_cubit.dart';
import '../homepage/table_change/change_table_page.dart';

class AppRount {
  static const String splashScreenPage = '/splashScreenPage';
  static const String loginpage = '/Login_page';
  static const String signinpage = '/SignIn_Page';
  static const String homepage = '/Homepahe';
  static const String menupage = '/Menu';
  static const String tabletype = '/tabletype';
  static const String changetable = '/changetable';
  static const String product = '/Product';
  static const String addproduct = '/Addproduct';
  static const String ListProduct = '/ListProduct';
  static const String orderlist = '/orderlist';
  static const String orderstatus = '/orderstatus';
  static const String checkbill = '/checkbill';

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
              authenRepository: context.read<AuthenRepository>(),
              tableprovider: context.read(),
            )
              ..getTabletypes()
              ..getTables(), // <---here is mean to access to two fucntion in the cubit
            child: Table_page(),
          ),
        );
      case changetable:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ChangTableCubit(
                authenRepository: context.read<AuthenRepository>(),
                tableprovider: context.read<tableProvider>())
              ..getTabletypes()
              ..getTables(),
            child: ChangeTable(),
          ),
        );
      case product:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProductsCubit(
                authenRepositorys: context.read<
                    AuthenRepository>()) // <--here is to read provider and Repository
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
              productmodel: settings.arguments
                  as ProductModel?, // <---here is to make send arguments from ProductModel to the addproduct page to make update
            )..producttypelist(),
            // ..unitlist()
            // ..initialDataForm(), // <---here is mean to access to two fucntion in the cubit
            child: Addproduct(),
          ),
        );
      case ListProduct:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LisproductCubit(
                orderproviders: context.read<orderprovider>(),
                authenRepository: context.read<AuthenRepository>(),
                tableproviders: context.read<tableProvider>())
              ..getProductTypes()
              ..getproduct()
            //..postorderlist()
            ,
            child: ListProduct_page(),
          ),
        );
      case orderlist:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OrderCubit(
                context: context,
                authenRepositorys: context.read<AuthenRepository>(),
                tableproviders: context.read<tableProvider>(),
                orderproviders: context.read<orderprovider>()),
            child: OrderList(),
          ),
        );
      case orderstatus:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OrderstatusCubit(
                tableproviders: context.read<tableProvider>(),
                orderproviders: context.read<orderprovider>(),
                authenRepository: context.read<AuthenRepository>())
              ..seletorderdata(),
            child: OrderstatusPage(),
          ),
        );
      case checkbill:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CheckbillCubit(
                authenRepository: context.read<AuthenRepository>(),
                tableproviders: context.read<tableProvider>(),
                context: context),
            child: CheckBill_Page(),
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
