import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/Dashboard/component/containner.dart';
import 'package:myproject/homepage/Dashboard/component/mealcontainner.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/location/location.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:myproject/homepage/table_page/table_page.dart';

import '../../generated/locale_keys.g.dart';
import '../../repository/authen_sipository.dart';
import '../menu_page/cubit/menu_cubit.dart';
import '../menu_page/menu.dart';
import '../nabar_page.dart';
import 'package:badges/badges.dart' as badges;

class Dashboard_page extends StatefulWidget {
  const Dashboard_page({super.key});

  @override
  State<Dashboard_page> createState() => _Dashboard_pageState();
}

class _Dashboard_pageState extends State<Dashboard_page> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Nabar(
          onChanged: (value) {
            onchangeLanguage(context,
                value); // <-- here is get the value of onchangeLanguage method in below code and send back to reflesh  or make reflesh in navbar page
          },
        ),
        appBar: AppBar(
          actions: [
            badges.Badge(
              badgeAnimation: const BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
              position: BadgePosition.topEnd(top: -1, end: -1),
              badgeContent: const Text(
                '1',
                style: TextStyle(color: Colors.red),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => cardlist()));
                },
              ),
            ),
          ],
          title: currentPageIndex == 0 ? Text("Dashboard") : Text('BM shop'),
        ),
        body: Builder(builder: (context) {
          if (currentPageIndex == 2) {
            return BlocProvider(
              create: (context) => MenuCubit(),
              child: Center(child: Homepage()),
            );
          }
          if (currentPageIndex == 1) {
            return BlocProvider(
              create: (context) => TabletypeCubit(
                  authenRepository: context.read<AuthenRepository>(),
                  tableprovider: context.read<tableProvider>())
                ..getTabletypes()
                ..getTables(), // <--here is becuse in the table page is use cubit therefore i have use blocProvider that i can access the table page
              child: Table_page(),
            );
          }

          if (currentPageIndex == 3) {
            return const Center(child: Location());
          }
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 2,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Daily Sell"),
                    ),
                    Dashboard(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Meal"),
                    ),
                    MealContainner_page(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ));
        }),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.red,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: NavigationBar(
                onDestinationSelected: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                selectedIndex: currentPageIndex,
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    selectedIcon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: LocaleKeys.home
                        .tr(), //-------it is text here of " home "----------
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.table_bar),
                    selectedIcon: Icon(
                      Icons.table_bar,
                      color: Colors.white,
                    ),
                    label: LocaleKeys.order
                        .tr(), //-------it is text here of " Order "----------
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.book),
                    selectedIcon: Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    label: LocaleKeys.manage
                        .tr(), //-------it is text here of " Manage "----------
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.location_on),
                    selectedIcon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    label: LocaleKeys.location
                        .tr(), //-------it is text here of " Location "----------
                  ),
                ]),
          ),
        ));
  }

  // //-------this fucntion is to make setstate and send value back to the appbar---because in nabar is stateless so we can not use setstate
  onchangeLanguage(BuildContext context, String value) {
    context.setLocale(Locale(value));
    setState(() {});
  }
}
