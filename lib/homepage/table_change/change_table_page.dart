import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/icon_map.dart';
import 'package:myproject/generated/locale_keys.g.dart';
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
        //var tableprovider = context.read<tableProvider>();
        return Consumer<tableProvider>(
          builder: (context, tableprovider, child) {
            return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    onTap: () {
                      tableprovider
                          .clearTable(); //<---here is make clear when i back
                      tableprovider
                          .clearData(); //<---here is make clear when i back
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                title:
                    Text(LocaleKeys.changeTable.tr()), // <---text of move table
              ),
              body: Container(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.tabletype
                                .tr(), // <-------------text of table type----------
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
                                if (state.listtabletype![i] ==
                                    state.typeSelect) {
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
                                              color: Color.fromARGB(
                                                      77, 219, 216, 216)
                                                  .withOpacity(1),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                        LocaleKeys.changeTable
                            .tr(), // <-------------text of change table----------
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                          },
                          child: Container(
                              width: 80,
                              height: 85,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      color: tableprovider.FromTable == "1"
                                          ? Colors.red
                                          : Color.fromARGB(77, 219, 216, 216)
                                              .withOpacity(
                                                  1), // <--- here  is a condition of change color
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
                                    Text(
                                      LocaleKeys.fromTable.tr(),
                                      overflow: TextOverflow.ellipsis,
                                    ), // <---text of from table-----
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
                            cubit.getOrderFromTable(context);
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
                          },
                          child: Container(
                              width: 80,
                              height: 85,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      color: tableprovider.ToTable == "2"
                                          ? Colors.red
                                          : Color.fromARGB(77, 219, 216, 216)
                                              .withOpacity(1),
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
                                    Text(
                                      LocaleKeys.toTable.tr(),
                                    ), // <---text of To table-----
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
                        LocaleKeys.allTable.tr(), // <----text of all table-----
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                            children: List.generate(
                                cubit.state.listtable!.length, (index) {
                              var listtable = state.listtable;
                              if (listtable![index].tableStatus == 0) {
                                _containercolor = Colors.green;
                                textcontrol = LocaleKeys.tableAvailable
                                    .tr(); // <-----text of available table
                              }
                              if (listtable[index].tableStatus == 1) {
                                _containercolor = Color.fromARGB(255, 226, 203, 1);
                                textcontrol = LocaleKeys.tableunAvailable
                                    .tr(); // <-----text of Unavailable table
                              }
                              if (listtable[index].tableStatus == 2) {
                                _containercolor = Colors.red;
                                textcontrol = "ບໍ່ຫວ່າງ";
                              }

                              return itemDashboard(
                                  // -- here is to send the value to the (itemDashboard)---
                                  cubit, // <-- this line is to connect the cubit to below code (itemDashboard)
                                  tableprovider,
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
      },
    );
  }

  itemDashboard(
          ChangTableCubit
              cubits, // here is to accept the value from above to show here
          tableProvider tableprovider,
          String title,
          String size,
          Icon IconData,
          Tables table) =>
      GestureDetector(
        onTap: () {
          cubits.ontypechangetable(
              table); // <-- here is to send the value to cubit
          cubits; // <--here to make access to the above wedget i just use cubits here then it can connect to the cubit above auto
          if (table.tableStatus == 0 &&
              tableprovider.FromTable != "1" &&
              tableprovider.ToTable != "2") {
            navService.pushNamed(AppRount.ListProduct).then((value) {
              if (value == true) {
                cubits.getTables();

                /// here is get the value true from the listproduct page to refresh here i use pop then can uderstand auto
              }
            });
          }
          if (table.tableStatus == 1 &&
              tableprovider.FromTable != "1" &&
              tableprovider.ToTable != "2") {
            
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
