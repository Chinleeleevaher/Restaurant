// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/Dashboard/component/containner.dart';
import 'package:myproject/homepage/Dashboard/component/mealcontainner.dart';
import 'package:myproject/homepage/Dashboard/cubit/dashboard_cubit.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/kitchen/cubit/kitchen_cubit.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';
import 'package:myproject/homepage/kitchen/kitchen.dart';
import 'package:myproject/homepage/location/location.dart';
import 'package:myproject/homepage/menu_page/menuProvider.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:myproject/homepage/table_page/table_page.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:provider/provider.dart';

import '../../generated/locale_keys.g.dart';
import '../../repository/authen_sipository.dart';
import '../menu_page/cubit/menu_cubit.dart';
import '../nabar_page.dart';

class Dashboard_page extends StatefulWidget {
  const Dashboard_page({super.key});

  @override
  State<Dashboard_page> createState() => _Dashboard_pageState();
}

class _Dashboard_pageState extends State<Dashboard_page> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // var userProvider = context.read<UserProvider>();
    // var status = '';
    // if (userProvider.user != null) {
    //   status = userProvider.user!.status;
    // }

    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Consumer<UserProvider>(builder: (context, userProvider, widget) {
          var status = '';
          if (userProvider.user != null) {
            status = userProvider.user!.status;
          }

          return Scaffold(
              drawer: Nabar(
                onChanged: (value) {
                  onchangeLanguage(context,
                      value); // <-- here is get the value of onchangeLanguage method in below code and send back to reflesh  or make reflesh in navbar page
                },
              ),
              appBar: AppBar(
                title: currentPageIndex == 0
                    ? Text(LocaleKeys.Dashboard.tr()) // Dashboard
                    : const Text(' Naban Restauran'),
              ),
              body: Builder(builder: (context) {
                if (state.status == dashBoardstatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                }
                //........ກໍານົດສິດໃຫ້ພະນັກງານເຮືອນຄົວ................
                if (status == "Chefs" && currentPageIndex == 0) {
                  return BlocProvider(
                    create: (context) => KitchenCubit(
                        authenRepository: context.read<AuthenRepository>(),
                        context: context, productId: '', kitchenProviders: context.read<kitchenProvider>()),
                    child: const Center(child: Kitchen()),
                  );
                }
                //........ກໍານົດສິດໃຫ້ພະນັກງານເສີບ................
                if (status == "Waiter" && currentPageIndex == 0) {
                  return BlocProvider(
                    create: (context) => TabletypeCubit(
                        authenRepository: context.read<AuthenRepository>(),
                        tableprovider: context.read<tableProvider>())
                      ..getTabletypes()
                      ..getTables(), // <--here is becuse in the table page is use cubit therefore i have use blocProvider that i can access the table page
                    child: const Table_page(),
                  );
                }
                //........ກໍານົດສິດໃຫ້ພະນັກງານເສີບ................

                if (status == "Waiter" && currentPageIndex == 1) {
                  return BlocProvider(
                    create: (context) => MenuCubit(
                      orderproviders: context.read<orderprovider>(),
                      tableProviders: context.read<tableprovide>(),
                      authenRepository: context.read<AuthenRepository>(),
                      tablePros: context.read<tableProvider>(),
                      context: context,
                    ),
                    child: const Center(child: Homepage()),
                  );
                }
                //........ກໍານົດສິດໃຫ້ພະນັກງານເສີບ................

                if (status == "Waiter" && currentPageIndex == 2) {
                  return const Center(child: Location());
                }
                if (currentPageIndex == 2) {
                  return BlocProvider(
                    create: (context) => MenuCubit(
                      orderproviders: context.read<orderprovider>(),
                      tableProviders: context.read<tableprovide>(),
                      authenRepository: context.read<AuthenRepository>(),
                      tablePros: context.read<tableProvider>(),
                      context: context,
                    ),
                    child: const Center(child: Homepage()),
                  );
                }
                //........ຂອງ Admin................

                if (currentPageIndex == 1) {
                  return BlocProvider(
                    create: (context) => TabletypeCubit(
                        authenRepository: context.read<AuthenRepository>(),
                        tableprovider: context.read<tableProvider>())
                      ..getTabletypes()
                      ..getTables(), // <--here is becuse in the table page is use cubit therefore i have use blocProvider that i can access the table page
                    child: const Table_page(),
                  );
                }

                if (currentPageIndex == 3) {
                  return const Center(child: Location());
                }

                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 2,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:
                                Text(LocaleKeys.DailySell.tr()), //..daily sell
                          ),
                          const Dashboard(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(LocaleKeys.Meal.tr()),
                          ),
                          const MealContainner_page(),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ));
              }),
              bottomNavigationBar:
                  //........ກໍານົດສິດໃຫ້ພະນັກງານເຮືອນຄົວ ແມ່ນບໍ່ໃຫ້ສະແດງລາຍການ nabar................
                  status == "Chefs"
                      ? null
                      : NavigationBarTheme(
                          data: NavigationBarThemeData(
                            indicatorColor: Colors.red,
                            labelTextStyle: WidgetStateProperty.all(
                              const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: NavigationBar(
                                onDestinationSelected: (int index) {
                                  setState(() {
                                    currentPageIndex = index;
                                  });
                                },
                                selectedIndex: currentPageIndex,
                                //........ກໍານົດສິດໃຫ້ພະນັກງານເສີບໃຫ້ສະແດງແຕ່ 3 nabar ຂອງ waiter................
                                destinations: status == "Waiter"
                                    ? [
                                        NavigationDestination(
                                          icon: const Icon(Icons.table_bar),
                                          selectedIcon: const Icon(
                                            Icons.table_bar,
                                            color: Colors.white,
                                          ),
                                          label: LocaleKeys.order
                                              .tr(), //-------it is text here of " Order "----------
                                        ),
                                        NavigationDestination(
                                          icon: const Icon(Icons.book),
                                          selectedIcon: const Icon(
                                            Icons.book,
                                            color: Colors.white,
                                          ),
                                          label: LocaleKeys.manage
                                              .tr(), //-------it is text here of " Manage "----------
                                        ),
                                        NavigationDestination(
                                          icon: const Icon(Icons.location_on),
                                          selectedIcon: const Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          label: LocaleKeys.location
                                              .tr(), //-------it is text here of " Location "----------
                                        ),
                                      ]
                                    :
                                    //.......nabr ຂອງ admin................
                                    [
                                        NavigationDestination(
                                          icon: const Icon(Icons.home),
                                          selectedIcon: const Icon(
                                            Icons.home,
                                            color: Colors.white,
                                          ),
                                          label: LocaleKeys.home
                                              .tr(), //-------it is text here of " home "----------
                                        ),
                                        NavigationDestination(
                                          icon: const Icon(Icons.table_bar),
                                          selectedIcon: const Icon(
                                            Icons.table_bar,
                                            color: Colors.white,
                                          ),
                                          label: LocaleKeys.order
                                              .tr(), //-------it is text here of " Order "----------
                                        ),
                                        NavigationDestination(
                                          icon: const Icon(Icons.book),
                                          selectedIcon: const Icon(
                                            Icons.book,
                                            color: Colors.white,
                                          ),
                                          label: LocaleKeys.manage
                                              .tr(), //-------it is text here of " Manage "----------
                                        ),
                                        NavigationDestination(
                                          icon: const Icon(Icons.location_on),
                                          selectedIcon: const Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          label: LocaleKeys.location
                                              .tr(), //-------it is text here of " Location "----------
                                        ),
                                      ]),
                          ),
                        ));
        });
      },
    );
  }

  // //-------this fucntion is to make setstate and send value back to the appbar---because in nabar is stateless so we can not use setstate
  onchangeLanguage(BuildContext context, String value) {
    context.setLocale(Locale(value));
    setState(() {});
  }
}
