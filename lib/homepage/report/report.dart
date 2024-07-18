import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:myproject/homepage/Dashboard/component/mealcontainner.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/report/component/printDailog.dart';
import 'package:myproject/homepage/report/incomeModel/INcomeModel.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'cubit/order_cubit.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderReportCubit, OrderReportState>(
      listener: (context, state) {},
      builder: (context, state) {
        log('status in buider=== ${state.status}');
        var cubit = context.read<OrderReportCubit>();

        // ignore: non_constant_identifier_names
        var Repotprovider = context.read<ReportProvider>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Report"),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                        onTap: () {
                          cubit.ontypePrint();
                          // printdailog(context);
                        },
                        child: const Icon(Icons.print)),
                  )
                ],
              )
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          // controller: cubit.UserNameControllerr,
                          decoration: InputDecoration(
                            hintText: cubit.from_pickdate.toString(),
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                final DateTime? selectedDate =
                                    await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(
                                      2100), //-----of date time picker-------------
                                ).then((value) {
                                  setState(() {
                                    cubit.from_pickdate = value!;
                                  });
                                });
                              },
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.compare_arrows_sharp),
                    Expanded(
                      child: TextFormField(
                        // controller: cubit.UserNameControllerr,
                        decoration: InputDecoration(
                          hintText: cubit.To_pickdate.toString(),
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          suffixIcon: IconButton(
                            onPressed: () async {
                              //-----of date time picker-------------
                              final DateTime? selectedDate =
                                  await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              ).then((value) {
                                setState(() {
                                  cubit.To_pickdate = value!;
                                });
                              });
                            },
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ລາຍງານຕາມປະເພດ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cubit.typeOrderReport(1);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, bottom: 10),
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: const Color.fromARGB(77, 219, 216, 216)
                                  .withOpacity(1),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    //.....of product
                    GestureDetector(
                      onTap: () {
                        cubit.typeOrderReport(2);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, bottom: 10),
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: const Color.fromARGB(77, 219, 216, 216)
                                  .withOpacity(1),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Product",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.typeOrderReport(3); // Example for "income"
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, bottom: 10),
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: const Color.fromARGB(77, 219, 216, 216)
                                  .withOpacity(1),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "income",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.typeOrderReport(4); // Example for "staff"
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, bottom: 10),
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: const Color.fromARGB(77, 219, 216, 216)
                                  .withOpacity(1),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "staff",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(builder: (context) {
                // <---here is make check if order type then show only order data and if product type then show only product data
                if (state.orderType == 2) {
                  return Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("ລ/ດ"),
                              VerticalDivider(),
                              Text("ລາຍການ"),
                              VerticalDivider(),
                              Text("ທັງໝົດ"),
                              VerticalDivider(),
                              Text("ຂາຍອອກ"),
                              VerticalDivider(),
                              Text("ຍັງເຫຼືອ"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 2,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Builder(builder: (context) {
                            if (state.status == orderlistreportstatus.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state.orderlist!.isEmpty) {
                              return const Center(
                                child: Text("Chose the date you want to show"),
                              );
                            }
                            return Column(
                              children: List.generate(
                                  Repotprovider.AllcollectReport!.length,
                                  (index) {
                                return Card(
                                  child: GestureDetector(
                                    onTap: () {
                                      //   cubit.selectproduct_makeReport();
                                    },
                                    child: InkWell(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text((index + 1).toString()),
                                                const VerticalDivider(),
                                                Text(
                                                  Repotprovider
                                                      .AllcollectReport![index]
                                                      .productName,
                                                ),
                                                const VerticalDivider(),
                                                Text(Repotprovider
                                                    .AllcollectReport![index]
                                                    .protypeId
                                                    .toString()), // <--this is of all qty
                                                const VerticalDivider(),
                                                Text(
                                                  Repotprovider
                                                      .AllcollectReport![index]
                                                      .unitId
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ), // <--this is of sell qty
                                                const VerticalDivider(),
                                                Text(
                                                  Repotprovider
                                                      .AllcollectReport![index]
                                                      .quantity
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.green),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                }

                ///..... of income........................

                if (state.orderType == 3) {
// Assuming cubit.data2 is a List<double> or List<int>
                  List<num> data = cubit.data2
                      .map((value) => value.toDouble())
                      .toList(); // Ensure data is in numeric format

                  String seriesData = jsonEncode(data);

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 250,
                          child: Echarts(
                            option: '''
      {
        title: {
          text: 'Weekly Sales Data'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
      
        grid: {
          left: '1%',
          right: '18%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'value'
        },
        yAxis: {
          type: 'category',
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        },
        series: [
          {
            name: 'income',
            type: 'bar',
            label: {
              show: true,
              position: 'right',
              formatter: '{c} kip',  // Display the value of each bar followed by "kip"
              color: 'green',         // Set the color of "kip" to red
            },
          
            data: $seriesData       // Insert your series data here
              }
            ]
          }
          ''',
                          ),
                        ),
                        const Divider(),
                         const MealContainner_page(),
                      ],
                    ),
                  );
                }

                ///...........of order......................
                return Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("ລ/ດ"),
                            VerticalDivider(),
                            Text("ເລກບິນ"),
                            VerticalDivider(),
                            Text("ວັນທີ"),
                            VerticalDivider(),
                            Text("ຈໍານວນ"),
                            VerticalDivider(),
                            Text("ຈ່າຍ"),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        // height: 500,
                        // width: 550,
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 2,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Builder(builder: (context) {
                          if (state.status == orderlistreportstatus.loading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            );
                          }
                          if (state.orderlist!.isEmpty) {
                            return const Center(
                              child: Text("Chose the date you want to show"),
                            );
                          }
                          return Column(
                            children: List.generate(
                                Repotprovider.orderReport!.length, (index) {
                              var orderlist = Repotprovider.orderReport![index];
                              DateFormat formatter = DateFormat(
                                  'dd-MM-yyyy HH:mm'); // <-- here is make formate the date befor i take it to show
                              String formattedDate =
                                  formatter.format(orderlist.orDate);
                              return Card(
                                child: GestureDetector(
                                  onTap: () {
                                    cubit.getorderdetail(orderlist);
                                  },
                                  child: InkWell(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          // leading: Text((index + 1).toString()),
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text((index + 1).toString()),
                                              const VerticalDivider(),
                                              Text(
                                                orderlist.orId.toString(),
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                              const VerticalDivider(),
                                              Text(formattedDate),
                                              const VerticalDivider(),
                                              Text(orderlist.orQty.toString()),
                                              const VerticalDivider(),
                                              Text(
                                                orderlist.payment.toString(),
                                                style: const TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
