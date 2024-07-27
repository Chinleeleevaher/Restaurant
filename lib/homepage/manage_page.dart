// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/generated/locale_keys.g.dart';

class Manage_page extends StatefulWidget {
  const Manage_page({super.key});

  @override
  State<Manage_page> createState() => _Manage_pageState();
}

class _Manage_pageState extends State<Manage_page>
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
    return Scaffold(
      appBar: AppBar(
        title:  Text(LocaleKeys.manage.tr()),// ...manage
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () => navService.pushNamed(AppRount.product),
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
                            child:  Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.shop,
                                  size: 50,
                                  color: Colors.green,
                                ),
                                Text(LocaleKeys.product.tr())
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            navService.pushNamed(AppRount.addcategory);
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
                            child:  Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.category,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                Text(LocaleKeys.category.tr())
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () => navService.pushNamed(AppRount.addunit),
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
                                  Icons.ac_unit,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                Text(LocaleKeys.unit.tr())
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
                            navService.pushNamed(AppRount.orderProduct);
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
                                  Icons.add,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                Text(LocaleKeys.orderpro.tr())// order product
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
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 5),
                                    color: Color.fromARGB(77, 11, 11, 11),
                                    spreadRadius: 2,
                                    blurRadius: 5)
                              ]),
                          child:  Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                     navService.pushNamed(AppRount.importProduct);
                                },
                                child: const Icon(
                                  Icons.production_quantity_limits,
                                  size: 50,
                                  color: Colors.green,
                                ),
                              ),
                              Text(LocaleKeys.improtpro.tr())// improt product
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                             navService.pushNamed(AppRount.addtable);
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
                            child:  Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.table_bar,
                                  size: 50,
                                  color: Colors.red,
                                ),
                                Text(LocaleKeys.addtable.tr())/// add table
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
