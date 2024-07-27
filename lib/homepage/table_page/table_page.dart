
// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:myproject/homepage/table_page/model/table.dart';

class Table_page extends StatefulWidget {
  const Table_page({super.key});

  @override
  State<Table_page> createState() => _Table_pageState();
}

class _Table_pageState extends State<Table_page>
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

  Color _containercolor = Colors.green;
  String textcontrol = "";
  Text k = const Text("ok", style: TextStyle(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TabletypeCubit, TabletypeState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        var cubit = context.read<TabletypeCubit>();
        context.read<orderprovider>();
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Manage '),
          // ),
          body: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ປະເພດໂຕະ",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 251, 249, 249),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.state.listtabletype!.length,
                        itemBuilder: (c, i) {
                          var list = state.listtabletype;
                          Color textcolor = Colors.red;
                          Color containercolor = Colors.white;
                          if (state.listtabletype![i] == state.typeSelect) {
                            containercolor = Colors.red;
                            textcolor = Colors.white;
                          }
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                cubit.onTypeSelect(list[i]);
                                // cubit.onTypeSelect(list[
                                //     i]); // <--here is to make ontap and select in productype
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 15),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 5),
                                        color:
                                            const Color.fromARGB(77, 219, 216, 216)
                                                .withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: containercolor),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    list![i].tabletypeName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: textcolor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "ໂຕະທັງໝົດ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 500,
                  width: 350,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                      shrinkWrap: false,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(cubit.state.listtable!.length,
                          (index) {
                        var listtable = state.listtable;
                        if (listtable![index].tableStatus == 0) {
                          _containercolor = Colors.green;
                          textcontrol = "ຫວ່າງ";
                        }
                        if (listtable[index].tableStatus == 1) {
                          _containercolor = const Color.fromARGB(255, 226, 203, 1);
                          textcontrol = "ກໍາລັງລໍຖ້າ";
                        }
                        if (listtable[index].tableStatus == 2) {
                          _containercolor = Colors.red;
                          textcontrol = "ບໍ່ຫວ່າງ";
                        }
          
                        return itemDashboard(
                            // -- here is to send the value to the (itemDashboard)---
                            cubit, // <-- this line is to connect the cubit to below code (itemDashboard)
                            listtable[index].tableName.toString(),
                            listtable[index].tableSize.toString(),
                            const Icon(
                              Icons.table_bar,
                            ),
                            listtable[
                                index] // <---here is to send data to the cubit to the table below code
                            );
                      })),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  itemDashboard(
          TabletypeCubit
              cubits, // here is to accept the value from above to show here
          String title,
          String size,
          Icon IconData,
          Tables table) =>
      GestureDetector(
        onTap: () {
          cubits
              .ontypetablelist(table); // <-- here is to send the value to cubit
          cubits; // <--here to make access to the above wedget i just use cubits here then it can connect to the cubit above auto
          if (table.tableStatus == 0) {
            navService.pushNamed(AppRount.ListProduct).then((value) {
              if (value == true) {
                cubits.getTables();

                /// here is get the value true from the listproduct page to refresh here i use pop then can uderstand auto
              }
            });
          }
          if (table.tableStatus == 1 ) {
            navService.pushNamed(AppRount.orderstatusWaiting).then((value) {
              /// here is get the value true from the check bill page to refresh here i use pop then can uderstand auto
              if (value == true) {
                cubits.getTables();
              }
            });
          }
          if (table.tableStatus == 2 ) {
            navService.pushNamed(AppRount.orderstatus).then((value) {
              /// here is get the value true from the check bill page to refresh here i use pop then can uderstand auto
              if (value == true) {
                cubits.getTables();
              }
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: const Color.fromARGB(77, 219, 216, 216).withOpacity(1),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(
                      IconData.icon,
                      color: _containercolor,
                    ),
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    Text(textcontrol, style: TextStyle(color: _containercolor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
