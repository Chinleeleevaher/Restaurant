import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/internet/nointernet.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_history/cubit/orderstatus_cubit.dart';
import 'package:myproject/homepage/order_list/cubit/order_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:provider/provider.dart';

import '../../login/home_provider/provider.dart';

class OrderstatusPage extends StatefulWidget {
  const OrderstatusPage({super.key});

  @override
  State<OrderstatusPage> createState() => _OrderstatusPageState();
}

class _OrderstatusPageState extends State<OrderstatusPage> {
  @override
  Widget build(BuildContext context) {
    var orderlist = context.read<orderprovider>();
    var tableprovide = context.read<tableProvider>();
    return BlocConsumer<OrderstatusCubit, OrderstatusState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state.status == selectorderdata.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == selectorderdata.error) {
          if (state.error == 'No Internet connection') {
            return Center(
              child: NoInternetPage(
                  // onPressed: ()=>cubit.fetchProvider(),
                  ),
            );
          }
          // return ErrorPage(
          //   onPressed: ()=>cubit.fetchProvider(),
          // );
        }
        var cubit = context.read<OrderstatusCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: Container(
              child: GestureDetector(
                  onTap: () {
                    //orderlist.clearorderlist();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.reset_tv_outlined)),
            ),
            title: Text("Order select"),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "table : ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 15,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            tableprovide.tablenumber,
                            style: TextStyle(fontSize: 10, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          body: Column(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("ລ/ດ"),
                    VerticalDivider(),
                    Text("ລາຍການ"),
                    VerticalDivider(),
                    Text("ຈໍານວນ"),
                    VerticalDivider(),
                    Text("ລາຄາລວມ"),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Expanded(
                child: // orderlist.orderlist.productId != null && orderlist.orderlist.productId.isNotEmpty?
                    ListView.builder(
                        itemCount: orderlist.selectorderdata!.length,
                        itemBuilder: (c, i) {
                          var list = orderlist.selectorderdata;
                          return Card(
                            margin:
                                EdgeInsets.only(bottom: i + 1 == 10 ? 10 : 3),
                            elevation: 1,
                            child: Expanded(
                              child: ListTile(
                                leading: Text((i + 1).toString()),
                                title: Text(list![i].productName),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      (list[i].price).toString() + " Kip  ",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Text(list[i].qty.toString()),
                                  ],
                                ),
                                trailing: Text(
                                  (list[i].amount).toString() + " Kip  ",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          );
                        }),
              ),
              Container(
                  height: 100,
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'ທັງໝົດ: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: orderlist.selectorderdata![0].orAmount.toString() +
                                  " Kip", // here of total price
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   "ທັງໝົດ:  " + orderlist.totalprice.toString(),
                      //   style: TextStyle(color: Colors.red),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                //  orderlist.clear();
                              },
                              child: Text("Cencel"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                navService.pushNamed(AppRount.checkbill);
                              },
                              child: Text("Check in"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}
