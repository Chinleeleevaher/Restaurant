// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/Dashboard/cubit/dashboard_cubit.dart';
import 'package:myproject/homepage/addcategory/addcategory.dart';
import 'package:myproject/homepage/addcategory/cubit/category_cubit.dart';
import 'package:myproject/homepage/addcategory/provider/categoryProvider.dart';
import 'package:myproject/homepage/addproduct/addproduct_page.dart';
import 'package:myproject/homepage/addproduct/cubit/addproduct_cubit.dart';
import 'package:myproject/homepage/addtable/addtable.dart';
import 'package:myproject/homepage/addtable/cubit/addtable_cubit.dart';
import 'package:myproject/homepage/addtable/provider.dart';
import 'package:myproject/homepage/addunit/addunit_page.dart';
import 'package:myproject/homepage/addunit/cubit/addunit_cubit.dart';
import 'package:myproject/homepage/addunit/cubit/provider/AdUnitProvider.dart';
import 'package:myproject/homepage/check_bill/checkbill_page.dart';
import 'package:myproject/homepage/Dashboard/dashboard.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/import_Product/cubit/import_product_cubit.dart';
import 'package:myproject/homepage/import_Product/importProduct.dart';
import 'package:myproject/homepage/import_Product/provider/provider.dart';
import 'package:myproject/homepage/kitchen/cubit/kitchen_cubit.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';
import 'package:myproject/homepage/kitchen/kitchen.dart';
import 'package:myproject/homepage/kitchen/kitchenOrderlist.dart';
import 'package:myproject/homepage/manage_page.dart';
import 'package:myproject/homepage/menu_page/cubit/menu_cubit.dart';
import 'package:myproject/homepage/menu_page/menu.dart';
import 'package:myproject/homepage/menu_page/menuProvider.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/menu_page/orderlistmenu.dart';
import 'package:myproject/homepage/order/cubit/lisproduct_cubit.dart';
import 'package:myproject/homepage/order/listproduct_page.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_history/cubit/orderstatus_cubit.dart';
import 'package:myproject/homepage/order_history/order_status_page.dart';
import 'package:myproject/homepage/order_history/order_status_waiting.dart';
import 'package:myproject/homepage/order_list/cubit/order_cubit.dart';
import 'package:myproject/homepage/order_list/orderlist_page.dart';
import 'package:myproject/homepage/orderproduct/cubit/order_product_cubit.dart';
import 'package:myproject/homepage/orderproduct/opBill.dart';
import 'package:myproject/homepage/orderproduct/orderProduct.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:myproject/homepage/product_page/cubit/products_cubit.dart';
import 'package:myproject/homepage/product_page/product_page.dart';
import 'package:myproject/homepage/report/cubit/order_cubit.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:myproject/homepage/report/report.dart';
import 'package:myproject/homepage/splash_screen/cubit/splash_screen_cubit.dart';
import 'package:myproject/homepage/splash_screen/splash_screen_page.dart';
import 'package:myproject/homepage/table_change/cubit/chang_table_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:myproject/homepage/table_page/table_page.dart';
import 'package:myproject/homepage/user/addUser/addUser.dart';
import 'package:myproject/homepage/user/addUser/cubit/user_cubit.dart';
import 'package:myproject/homepage/user/addUser/updateUser.dart';
import 'package:myproject/homepage/user/getuser/cubit/get_user_cubit.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';
import 'package:myproject/homepage/user/getuser/user.dart';
import 'package:myproject/login/Login_Page.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/home_provider/provider.dart';
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
  static const String dashboard = '/Dashboard';
  static const String menupage = '/Menu';
  static const String tabletype = '/tabletype';
  static const String changetable = '/changetable';
  static const String product = '/Product';
  static const String addproduct = '/Addproduct';
  static const String addcategory = '/Addcategory';
  static const String addunit = '/Addunit';
  static const String addtable = '/Addtable';
  static const String ListProduct = '/ListProduct';
  static const String orderlist = '/orderlist';
  static const String OrderListMenus = '/orderlistMenus';
  static const String orderstatus = '/orderstatus';
  static const String orderstatusWaiting = '/orderstatusWaiting';
  static const String checkbill = '/checkbill';
  static const String report = '/report';
  static const String manage = '/manage';
  static const String kitchen = '/kitchen';
  static const String kitchenOrderlist = '/kitchenOrderlist';
  static const String getuser = '/getuser';
  static const String adduser = '/adduser';
  static const String updateUser = '/updateUser';
  static const String orderProduct = '/ordeProduct';
  static const String opListbill = '/opListbill';
  static const String importProduct = '/importproduct';

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
            child: const Login_page(),
          ),
        );
      case signinpage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignInCubit(),
            child: const SignIn_Page(),
          ),
        );
      case menupage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MenuCubit(
              orderproviders: context.read<orderprovider>(),
              tableProviders: context.read<tableprovide>(),
              authenRepository: context.read<AuthenRepository>(),
              tablePros: context.read<tableProvider>(),
              context: context,
            )
              ..getProductTypes()
              ..getproduct()
              ..menutable(), // <---here is mean to access to two fucntion in the cubit

            child: const Menu(),
          ),
        );
      case homepage:
        return MaterialPageRoute(
          builder: (context) => const Homepage(),
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DashboardCubit(
                authenRepository: context.read<AuthenRepository>(),
                reportProvider: context.read<ReportProvider>())
              ..selectWeekIncome()
              ..lowquantityProduct()
              ..selectInccomeMoth()
              ..selectInccomeYear(),
            child: const Dashboard_page(),
          ),
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
            child: const Table_page(),
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
            child: const ChangeTable(),
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
            child: const ProductPage(),
          ),
        );
      case orderProduct:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OrderProductCubit(
                authenRepository: context.read<AuthenRepository>(),
                provider: context.read<OrderProductProvider>(),
                context: context)
              ..getOrderProdct(),
            child: const OrderProduct(),
          ),
        );
      case opListbill:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OrderProductCubit(
                authenRepository: context.read<AuthenRepository>(),
                provider: context.read<OrderProductProvider>(),
                context: context)
              ..getOrderProdct()
              ..orderProductListBill(),
            child: const OrderProductListBill(),
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
            child: const Addproduct(),
          ),
        );
      case importProduct:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ImportProductCubit(
              authenRepository: context.read<AuthenRepository>(),
              providers: context.read<ImpProduct>(),
              context: context,
            ),
            child: const ImportProduct(),
          ),
        );
      case addcategory:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => CategoryCubit(
                    authenRepositorys: context.read<AuthenRepository>(),
                    categoryeprovider: context.read<categoryProvider>(),
                    // productTypemodel: settings as  AddProductypeModel,
                    productTypemodel: null,
                    context: context,
                  )..getproductype(),
                  child: const Category_page(),
                ));
      case addunit:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AddunitCubit(
                    authenRepositorys: context.read<AuthenRepository>(),
                    Unitprovider: context.read<UnitProvider>(),
                    // productTypemodel: settings as  AddProductypeModel,
                    //    productTypemodel: null,
                    context: context,
                  )..getUnit(),
                  child: const AddUnit_page(),
                ));
      case addtable:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AddtableCubit(
                    authenRepositorys: context.read<AuthenRepository>(),
                    tableproviders: context.read<tableProviderss>(),
                    //   Unitprovider: context.read<UnitProvider>(),
                    // productTypemodel: settings as  AddProductypeModel,
                    //    productTypemodel: null,
                    //  context: context,
                  )..getTatble(),
                  child: const addtable_page(),
                ));
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
            child: const ListProduct_page(),
          ),
        );
      case orderlist:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OrderCubit(
                context: context,
                authenRepositorys: context.read<AuthenRepository>(),
                tableproviders: context.read<tableProvider>(),
                orderproviders: context.read<orderprovider>(),
                tableprovideMenuPage: context.read<tableprovide>()),
            child: const OrderList(),
          ),
        );
      case OrderListMenus:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OrderCubit(
                context: context,
                authenRepositorys: context.read<AuthenRepository>(),
                tableproviders: context.read<tableProvider>(),
                orderproviders: context.read<orderprovider>(),
                tableprovideMenuPage: context.read<tableprovide>()),
            child: const OrderListMenu(),
          ),
        );
      case orderstatus:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OrderstatusCubit(
                tableproviders: context.read<tableProvider>(),
                orderproviders: context.read<orderprovider>(),
                authenRepository: context.read<AuthenRepository>(),
                context: context, kitchenProviders: context.read<kitchenProvider>())
              ..seletorderdata(),
            child: const OrderstatusPage(),
          ),
        );
      case orderstatusWaiting:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OrderstatusCubit(
                tableproviders: context.read<tableProvider>(),
                orderproviders: context.read<orderprovider>(),
                authenRepository: context.read<AuthenRepository>(),
                context: context, kitchenProviders: context.read<kitchenProvider>())
              ..seletorderdata()..getrejectOrder(),
            child: const OrderStatusWaitingPage(),
          ),
        );
      case checkbill:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CheckbillCubit(
                authenRepository: context.read<AuthenRepository>(),
                tableproviders: context.read<tableProvider>(),
                context: context),
            child: const CheckBill_Page(),
          ),
        );
      case report:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => OrderReportCubit(
                      authenRepository: context.read<AuthenRepository>(),
                      orderproviders: context.read<orderprovider>(),
                      context: context,
                      reportProvider: context.read<ReportProvider>(),
                      userprovider: context.read<getUserProvider>())
                    ..getOrderReport()
                    ..getuserReport(),
                  child: const ReportPage(),
                ));
      case manage:
        return MaterialPageRoute(
          builder: (context) => const Manage_page(),
        );
      case kitchenOrderlist:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => KitchenCubit(
                    authenRepository: context.read<AuthenRepository>(),
                    context: context, productId: '', kitchenProviders: context.read<kitchenProvider>(),
                  )..SelectorderbyOrderStatus()..GetOrdeinkitchen(),
                  child: const KitchenOrderList(),
                ));
        case kitchen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => KitchenCubit(
                    authenRepository: context.read<AuthenRepository>(),
                    context: context, productId: '', kitchenProviders: context.read<kitchenProvider>(),
                  )..SelectorderbyOrderStatus(),
                  child: const Kitchen(),
                ));
      case getuser:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => GetUserCubit(
                    authenRepository: context.read<AuthenRepository>(),
                    userprovider: context.read<getUserProvider>(),
                  )..getuser(),
                  child: const User(),
                ));
      case adduser:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => UserCubit(
                    authenRepository: context.read<AuthenRepository>(),
                    context: context,
                    userprovider: context.read<getUserProvider>(),

                    // userprovider: context.read<Userpro>(),
                  ),
                  child: const AddUser(),
                ));
      case updateUser:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => UserCubit(
                    authenRepository: context.read<AuthenRepository>(),
                    context: context,
                    userprovider: context.read<getUserProvider>(),

                    // userprovider: context.read<Userpro>(),
                  )..userData(),
                  child: const UpdateUser(),
                ));
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
