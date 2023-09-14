import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/table_change/cubit/chang_table_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:provider/provider.dart';

import '../../config/app_rount.dart';
import '../../config/navigation.dart';
import '../table_page/model/table.dart';

class ChangeTable extends StatefulWidget {
  const ChangeTable({super.key});

  @override
  State<ChangeTable> createState() => _ChangeTableState();
}

class _ChangeTableState extends State<ChangeTable> {
  Color _containercolor = Colors.green;
  String textcontrol = "";
  Text k = Text("ok", style: TextStyle(color: Colors.red));
  Color typeFromColor = Color.fromARGB(77, 219, 216, 216)
      .withOpacity(1); // <--of type color of table
  Color typeToColor = Color.fromARGB(77, 219, 216, 216)
      .withOpacity(1); // <--of type color of table
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangTableCubit, ChangTableState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<ChangTableCubit>();
        var tableprovider = context.read<tableProvider>();
        return Scaffold(
          appBar: AppBar(
            title: Text("Move table"),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            navService.pushNamed(AppRount.orderstatus);
                          },
                          child: Icon(Icons.list_alt_sharp))
                    ],
                  ))
            ],
          ),
          body: Container(
            child: ListView(
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
                      width: 360,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 251, 249, 249),
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: cubit.state.listtabletype!.length,
                          itemBuilder: (c, i) {
                            var list = state.listtabletype;
                            Color _textcolor = Colors.red;
                            Color _containercolor = Colors.white;
                            if (state.listtabletype![i] == state.typeSelect) {
                              _containercolor = Colors.red;
                              _textcolor = Colors.white;
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
                                  margin: EdgeInsets.only(left: 15),
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 5),
                                          color:
                                              Color.fromARGB(77, 219, 216, 216)
                                                  .withOpacity(1),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: _containercolor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Text(
                                      list![i].tabletypeName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: _textcolor),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "ຍ້າຍໂຕະ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cubit.onTypeSelecttablefrom("1");
                        if (tableprovider.FromTable == "1") {
                          setState(() {
                            typeFromColor = Colors.red;
                            typeToColor = Color.fromARGB(77, 219, 216, 216)
                                .withOpacity(1);
                            ;
                          });
                        }
                      },
                      child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  color: typeFromColor,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.table_bar,
                                  color: Colors.red,
                                ),
                                Text("Table"),
                                Consumer<tableProvider>(
                                  //---here is make change the value imedlainly----
                                  builder: (context, tableprovider, child) {
                                    return Text(
                                      tableprovider.fromtable,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.getOrderFromTable();
                      },
                      child: Icon(
                        Icons.queue_play_next,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.onTypeSelecttablefrom("2");
                        if (tableprovider.ToTable == "2") {
                          setState(() {
                            typeToColor = Colors.red;
                            typeFromColor = Color.fromARGB(77, 219, 216, 216)
                                .withOpacity(1);
                            ;
                          });
                        }
                      },
                      child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  color: typeToColor,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.table_bar,
                                  color: Colors.green,
                                ),
                                Text("Table"),
                                Consumer<tableProvider>(
                                  //---here is make change the value imedlainly----
                                  builder: (context, tableprovider, child) {
                                    return Text(
                                      tableprovider.totable,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "ໂຕະທັງໝົດ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 500,
                    width: 350,
                    decoration: BoxDecoration(color: Colors.white),
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
                            _containercolor = Colors.red;
                            textcontrol = "ບໍ່ຫວ່າງ";
                          }
                          if (listtable[index].tableStatus == 2) {
                            _containercolor = Colors.yellow;
                            textcontrol = "ກໍາລັງລໍຖ້າ";
                          }

                          return itemDashboard(
                              // -- here is to send the value to the (itemDashboard)---
                              cubit, // <-- this line is to connect the cubit to below code (itemDashboard)
                              listtable[index].tableName.toString(),
                              listtable[index].tableSize.toString(),
                              Icon(
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
          ),
        );
      },
    );
  }

  itemDashboard(
          ChangTableCubit
              cubits, // here is to accept the value from above to show here
          String title,
          String size,
          Icon IconData,
          Tables table) =>
      GestureDetector(
        onTap: () {
          cubits.ontypechangetable(
              table); // <-- here is to send the value to cubit
          cubits; // <--here to make access to the above wedget i just use cubits here then it can connect to the cubit above auto
          if (table.tableStatus == 1) {
            // navService.pushNamed(AppRount.ListProduct).then((value) {
            //   if (value == true) {
            //     cubits.getTables();

            //     /// here is get the value true from the listproduct page to refresh here i use pop then can uderstand auto
            //   }
            // });
          }
          if (table.tableStatus == 1) {
            // navService.pushNamed(AppRount.orderstatus).then((value) {
            //   /// here is get the value true from the check bill page to refresh here i use pop then can uderstand auto
            //   if (value == true) {
            //     cubits.getTables();
            //   }
            // });
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Color.fromARGB(77, 219, 216, 216).withOpacity(1),
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
