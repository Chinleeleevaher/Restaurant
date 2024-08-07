import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/manage_page.dart';
import 'package:myproject/homepage/menu_page/menu.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_change/change_table_page.dart';
import 'package:myproject/login/home_provider/provider.dart';

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
    context.read<orderprovider>();
    var userProvider = context.read<UserProvider>();
    var status = '';
    if (userProvider.user != null) {
      status = userProvider.user!.status;
    }

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
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
                       ( status=='Admin'||status=='Waiter' )?//....here is to make test to show as admin adn general staff
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Menu();
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
                                          color: const Color.fromARGB(77, 11, 11, 11)
                                              .withOpacity(0.1),
                                          // color: Theme.of(context)
                                          //     .primaryColor
                                          //     .withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Icon(
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
                        ):Container(),
                        ( status=='Admin'||status=='Waiter' )?
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ChangeTable();
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
                                          offset: Offset(0, 5),
                                          color: Color.fromARGB(77, 11, 11, 11),
                                          spreadRadius: 2,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Icon(
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
                        ):Container(),
                          status=='Admin'?
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Manage_page();
                              }));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 5),
                                        color: Color.fromARGB(77, 11, 11, 11),
                                        spreadRadius: 2,
                                        blurRadius: 5)
                                  ]),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
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
                        ):Container(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
  
                          status=='Admin'?
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
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 5),
                                        color: Color.fromARGB(77, 11, 11, 11),
                                        spreadRadius: 2,
                                        blurRadius: 5)
                                  ]),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
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
                        ):Container(),
                          status=='Admin'?
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 5),
                                        color: Color.fromARGB(77, 11, 11, 11),
                                        spreadRadius: 2,
                                        blurRadius: 5)
                                  ]),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navService.pushNamed(AppRount.getuser);
                                    },
                                    child: const Icon(
                                      Icons.people,
                                      size: 50,
                                      color: Colors.red,
                                    ),
                                  ),
                                Text(LocaleKeys.user.tr()) //<--- text of user-------
                                ],
                              ),
                            ),
                          ),
                        ):Container(),
                          status=='Admin'?
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              navService.pushNamed(AppRount.kitchenOrderlist);
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 5),
                                        color: Color.fromARGB(77, 11, 11, 11),
                                        spreadRadius: 2,
                                        blurRadius: 5)
                                  ]),
                              child: Column(
                                children: [
                                   const SizedBox(
                                    height: 10,
                                  ),
                                  const Icon(
                                    Icons.kitchen,
                                    size: 50,
                                    color: Colors.green,
                                  ),
                                  Text(LocaleKeys.kitchen.tr()) //<--- text of kitchen-------
                                ],
                              ),
                            ),
                          ),
                        )
                        :Container(),
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
