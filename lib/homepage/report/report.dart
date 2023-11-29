import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_list/cubit/order_cubit.dart';
import 'package:myproject/homepage/report/providerReport.dart';

import 'component/dailogbill.dart';
import 'component/typeList.dart';
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
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<OrderReportCubit>();
        var provider = context.read<orderprovider>();
        var Repotprovider = context.read<ReportProvider>();
        return Scaffold(
          appBar: AppBar(
            title: Text("Report"),
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
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
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
                              icon: Icon(
                                Icons.calendar_month_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.compare_arrows_sharp),
                    Expanded(
                      child: TextFormField(
                        // controller: cubit.UserNameControllerr,
                        decoration: InputDecoration(
                          hintText: cubit.To_pickdate.toString(),
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                            icon: Icon(
                              Icons.calendar_month_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      cubit.typeOrderReport(1);
                      cubit.TypeProductReport(
                          0); // <---here is to make clear the prducttype in state to the default again
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            color: Color.fromARGB(77, 219, 216, 216)
                                .withOpacity(1),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Order",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.TypeProductReport(2);
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            color: Color.fromARGB(77, 219, 216, 216)
                                .withOpacity(1),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Product",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Builder(builder: (context) {
                // <---here is make check if order type then show only order data and if product type then show only product data
                if (state.productType == 2) {
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
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Expanded(
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
                          decoration: BoxDecoration(color: Colors.white),
                          child: Builder(builder: (context) {
                            if (state.status == orderlistreportstatus.loading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state.orderlist!.isEmpty) {
                              return Center(
                                child: Text("Chose the date you want to show"),
                              );
                            }
                            return ListView(
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
                                                VerticalDivider(),
                                                Text(
                                                  Repotprovider
                                                      .AllcollectReport![index]
                                                      .productName,
                                                ),
                                                VerticalDivider(),
                                                Text(Repotprovider
                                                    .AllcollectReport![index]
                                                    .quantity
                                                    .toString()), // <--this is of still qty
                                                VerticalDivider(),
                                                Text(
                                                  Repotprovider
                                                      .AllcollectReport![index]
                                                      .unitId
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ), // <--this is of sell qty
                                                VerticalDivider(),
                                                Text(
                                                  Repotprovider
                                                      .AllcollectReport![index]
                                                      .protypeId
                                                      .toString(),
                                                  style: TextStyle(
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
                } else {
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
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Expanded(
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
                          decoration: BoxDecoration(color: Colors.white),
                          child: Builder(builder: (context) {
                            if (state.status == orderlistreportstatus.loading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state.orderlist!.isEmpty) {
                              return Center(
                                child: Text("Chose the date you want to show"),
                              );
                            }
                            return ListView(
                              children: List.generate(
                                  provider.orderReport!.length, (index) {
                                var orderlist = provider.orderReport![index];
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text((index + 1).toString()),
                                                VerticalDivider(),
                                                Text(
                                                  orderlist.orId.toString(),
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                VerticalDivider(),
                                                Text(formattedDate),
                                                VerticalDivider(),
                                                Text(
                                                    orderlist.orQty.toString()),
                                                VerticalDivider(),
                                                Text(
                                                  orderlist.payment.toString(),
                                                  style: TextStyle(
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
              }),
            ],
          ),
        );
      },
    );
  }
}
