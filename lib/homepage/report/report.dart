import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:myproject/homepage/report/component/incomContainer.dart';
import 'package:myproject/homepage/report/component/incomPrint.dart';
import 'package:myproject/homepage/report/component/prorductPrint.dart';
import 'package:myproject/homepage/report/component/userContainner.dart';
import 'package:myproject/homepage/report/component/userPrint.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'cubit/order_cubit.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

Future<void> selectDate(BuildContext context, TextEditingController controller) async {
  // Get the current date
  DateTime currentDate = DateTime.now();

  // Show the date picker
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(currentDate.year - 10),
    lastDate: DateTime(currentDate.year + 10),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: Colors.red, // Customize the color
          hintColor: Colors.red, // Customize the color
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
  );

  if (selectedDate != null && selectedDate != currentDate) {
    // Format the date to a string
    String formattedDate = "${selectedDate.toLocal()}".split(' ')[0]; // Change format as needed

    // Update the controller text with the selected date
    controller.text = formattedDate;
  }
}

class _ReportPageState extends State<ReportPage> {
  late TextEditingController _fromDateController;
  late TextEditingController _toDateController;

  @override
  void initState() {
    super.initState();
    _fromDateController = TextEditingController();
    _toDateController = TextEditingController();
  }

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderReportCubit, OrderReportState>(
      listener: (context, state) {},
      builder: (context, state) {
        log('status in builder=== ${state.status}');
        var cubit = context.read<OrderReportCubit>();
        var reportProvider = context.read<ReportProvider>();

        return Scaffold(
          appBar: AppBar(
            title: const Text("Report"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: const Icon(Icons.print),
                  onPressed: () {
                    if (state.orderType == 2) {
                      productPrint(context);
                    } else if (state.orderType == 3) {
                      IncomePrint(context);
                    } else if (state.orderType == 4) {
                      UserPrint(context);
                    }
                    cubit.ontypePrint();
                  },
                ),
              ),
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
                          controller: _fromDateController,
                          decoration: InputDecoration(
                            hintText: cubit.from_pickdate.toString(),
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            suffixIcon: IconButton(
                              onPressed: () async {
                            //    await selectDate(context, _fromDateController);
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
                        controller: _toDateController,
                        decoration: InputDecoration(
                          hintText: cubit.To_pickdate.toString(),
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          suffixIcon: IconButton(
                            onPressed: () async {
                             // await selectDate(context, _toDateController);
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
                child: Text(
                  "ລາຍງານຕາມປະເພດ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cubit.typeOrderReport(1);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
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
                        child: const Text(
                          "Order",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.typeOrderReport(2);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
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
                        child: const Text(
                          "Product",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.typeOrderReport(3);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
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
                        child: const Text(
                          "Income",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.typeOrderReport(4);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
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
                        child: const Text(
                          "Staff",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
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
                          child: const Row(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Builder(
                              builder: (context) {
                                if (state.status == orderlistreportstatus.loading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state.orderlist!.isEmpty) {
                                  return const Center(
                                    child: Text("Choose the date you want to show"),
                                  );
                                }
                                return ListView.builder(
                                  itemCount: reportProvider.getproductReport!.length,
                                  itemBuilder: (context, index) {
                                    var report = reportProvider.getproductReport![index];
                                    var total = reportProvider.AllcollectReport![index];
                                    return Card(
                                      child: ListTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text((index + 1).toString()),
                                            const VerticalDivider(),
                                            Text(report.productName),
                                            const VerticalDivider(),
                                            Text(total.protypeId.toString()), // <-- all qty
                                            const VerticalDivider(),
                                            Text(
                                              total.unitId.toString(),
                                              style: const TextStyle(color: Colors.red),
                                            ), // <-- sell qty
                                            const VerticalDivider(),
                                            Text(
                                              report.quantity.toString(),
                                              style: const TextStyle(color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  if (state.orderType == 3) {
                    List<num> data = cubit.data2
                        .map((value) => value.toDouble())
                        .toList(); // Ensure data is in numeric format

                    String seriesData = jsonEncode(data);

                    return Padding(
                      padding: const EdgeInsets.all(10),
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
                                    left: '0%',
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
                                        formatter: '{c} kip',
                                        color: 'green'
                                      },
                                      data: $seriesData
                                    }
                                  ]
                                }
                              ''',
                            ),
                          ),
                          const Divider(),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Income",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: incomContainner_page(),
                          )
                        ],
                      ),
                    );
                  }

                  if (state.orderType == 4) {
                    return const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: UserReport(),
                        )
                      ],
                    );
                  }

                  // Default case: Order Report
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
                        child: const Row(
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
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Builder(
                            builder: (context) {
                              if (state.status == orderlistreportstatus.loading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                );
                              }
                              if (state.orderlist!.isEmpty) {
                                return const Center(
                                  child: Text("Choose the date you want to show"),
                                );
                              }
                              return ListView.builder(
                                itemCount: reportProvider.orderReport!.length,
                                itemBuilder: (context, index) {
                                  var orderlist = reportProvider.orderReport![index];
                                  DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');
                                  String formattedDate = formatter.format(orderlist.orDate);
                                  return GestureDetector(
                                    onTap: () {
                                      cubit.getorderdetail(reportProvider.orderReport![index]);
                                    },
                                    child: Card(
                                      child: ListTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text((index + 1).toString()),
                                            const VerticalDivider(),
                                            Text(
                                              orderlist.orId.toString(),
                                              style: const TextStyle(color: Colors.red),
                                            ),
                                            const VerticalDivider(),
                                            Text(formattedDate),
                                            const VerticalDivider(),
                                            Text(orderlist.orQty.toString()),
                                            const VerticalDivider(),
                                            Text(
                                              orderlist.payment.toString(),
                                              style: const TextStyle(color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
