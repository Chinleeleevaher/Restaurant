import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/manage_page.dart';
import 'package:myproject/homepage/menu_page/menu.dart';
import 'package:myproject/homepage/nabar_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_change/change_table_page.dart';
import 'package:myproject/homepage/table_page/table_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orderproviders = context.read<orderprovider>();
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Menu();
                              }));
                            },
                            child: GestureDetector(
                              onTap: () {
                                navService.pushNamed(AppRount.menupage);
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 5),
                                          color: Color.fromARGB(77, 11, 11, 11)
                                              .withOpacity(0.1),
                                          // color: Theme.of(context)
                                          //     .primaryColor
                                          //     .withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Icon(
                                      Icons.menu,
                                      size: 50,
                                      color: Colors.blue,
                                    ),
                                    Text(LocaleKeys.menu
                                        .tr()) //<--- text of Menu-------
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return ChangeTable();
                              }));
                            },
                            child: GestureDetector(
                              onTap: () {
                                navService.pushNamed(AppRount.changetable);
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: const Offset(0, 5),
                                          color: Color.fromARGB(77, 11, 11, 11),
                                          spreadRadius: 2,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Icon(
                                      Icons.move_down,
                                      size: 50,
                                      color: Colors.blue,
                                    ),
                                    Text(LocaleKeys.changeTable
                                        .tr()) //<--- text of change table-------
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Manage_page();
                              }));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 5),
                                        color: Color.fromARGB(77, 11, 11, 11),
                                        spreadRadius: 2,
                                        blurRadius: 5)
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.manage_search,
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                  Text(LocaleKeys.product
                                      .tr()) //<--- text of Product-------
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              //   orderproviders.orderReport
                              navService.pushNamed(AppRount.report);
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 5),
                                        color: Color.fromARGB(77, 11, 11, 11),
                                        spreadRadius: 2,
                                        blurRadius: 5)
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.list,
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                  Text(LocaleKeys.report
                                      .tr()) //<--- text of Report-------
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 5),
                                      color: Color.fromARGB(77, 11, 11, 11),
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.people,
                                  size: 50,
                                  color: Colors.red,
                                ),
                                Text(LocaleKeys.scan
                                    .tr()) //<--- text of Scan-------
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 5),
                                      color: Color.fromARGB(77, 11, 11, 11),
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.kitchen,
                                  size: 50,
                                  color: Colors.green,
                                ),
                                Text(LocaleKeys.security
                                    .tr()) //<--- text of Scurity-------
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
