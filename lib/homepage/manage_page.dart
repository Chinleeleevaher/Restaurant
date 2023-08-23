import 'package:flutter/material.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/nabar_page.dart';

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
        title: Text('Manage '),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                                    color: Color.fromARGB(77, 11, 11, 11)
                                        .withOpacity(0.1),
                                    // color: Theme.of(context)
                                    //     .primaryColor
                                    //     .withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5)
                              ]),
                          child:const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.production_quantity_limits,
                                size: 50,
                                color: Colors.blue,
                              ),
                              Text("Product")
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
                                  offset: const Offset(0, 5),
                                  color: Color.fromARGB(77, 11, 11, 11),
                                  spreadRadius: 2,
                                  blurRadius: 5)
                            ]),
                        child:const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.category,
                              size: 50,
                              color: Colors.blue,
                            ),
                            Text("category")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
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
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.ac_unit,
                              size: 50,
                              color: Colors.blue,
                            ),
                            Text("Unit")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const[
                              BoxShadow(
                                  offset: const Offset(0, 5),
                                  color: Color.fromARGB(77, 11, 11, 11),
                                  spreadRadius: 2,
                                  blurRadius: 5)
                            ]),
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.table_bar,
                              size: 50,
                              color: Colors.blue,
                            ),
                            Text("Table")
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
                            boxShadow: const [
                              BoxShadow(
                                  offset: const Offset(0, 5),
                                  color: Color.fromARGB(77, 11, 11, 11),
                                  spreadRadius: 2,
                                  blurRadius: 5)
                            ]),
                        child:const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.type_specimen,
                              size: 50,
                              color: Colors.green,
                            ),
                            Text("table type")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
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
                        child:const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.security,
                              size: 50,
                              color: Colors.red,
                            ),
                            Text("Security")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
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
                                  offset: const Offset(0, 5),
                                  color: Color.fromARGB(77, 11, 11, 11),
                                  spreadRadius: 2,
                                  blurRadius: 5)
                            ]),
                        child:const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.blue,
                            ),
                            Text("Manage user")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
