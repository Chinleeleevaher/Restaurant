
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_history/cubit/orderstatus_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';


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
       
      },
      builder: (context, state) {
        var cubit = context.read<OrderstatusCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  //orderlist.clearorderlist();
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            title: Text(LocaleKeys.orderSelect
                .tr()), //<----text of order select it is on the appbar---
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${LocaleKeys.table.tr()} ", // <--- text of table
                        style: const TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            tableprovide.tablenumber.toString(),
                            style: const TextStyle(fontSize: 10, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){
                       navService.pushNamed(AppRount.ListProduct);
                      }, icon: const Icon(Icons.add))
                    ],
                  ))
            ],
          ),
          body: Builder(
            builder: (context) {
              // if (state.status == selectorderdata.loading) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              if (orderlist.selectorderdata == null ||
                  orderlist.selectorderdata!.isEmpty) {
                return const Center(
                  child: Text('data empty'),
                );
              }

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(LocaleKeys.no.tr()), //<----text of NO---
                        const VerticalDivider(),
                        Text(LocaleKeys.item.tr()), //<----text of item---
                        const VerticalDivider(),
                        Text(LocaleKeys.quantity
                            .tr()), //<----text of quantity---
                        const VerticalDivider(),
                        Text(LocaleKeys.amount.tr()), //<----text of Amount---
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Expanded(
                    child: // orderlist.orderlist.productId != null && orderlist.orderlist.productId.isNotEmpty?
                        ListView.builder(
                            itemCount: orderlist.selectorderdata!.length,
                            //itemCount: state.selectOrderList!.length,
                            itemBuilder: (c, i) {
                              var list = orderlist.selectorderdata;
                              //var list = state.selectOrderList;
                              return Card(
                                margin: EdgeInsets.only(
                                    bottom: i + 1 == 10 ? 10 : 3),
                                elevation: 1,
                                child: Expanded(
                                  child: ListTile(
                                    leading: Text((i + 1).toString()),
                                    title: Text(list![i].productName),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          "${list[i].price} Kip  ",
                                          style: const TextStyle(color: Colors.red),
                                        ),
                                        const SizedBox(
                                          width: 60,
                                        ),
                                        Text(list[i].qty.toString()),
                                      ],
                                    ),
                                    trailing: Text(
                                      "${list[i].amount} Kip  ",
                                      style: const TextStyle(color: Colors.red),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "${LocaleKeys.totalPrice.tr()}: ", // <----text of total price
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),

                              children: <TextSpan>[
                                TextSpan(
                                  text: "${orderlist.selectorderdata![0].orAmount} Kip", // here of total price
                                  style: const TextStyle(color: Colors.red),
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
                                  child: Text(LocaleKeys.cencel
                                      .tr(),style: const TextStyle(color: Colors.red)), // <----text of Check Cencel-----
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cubit.cut_stock().then((value) {
                                      navService.pushNamed(AppRount.checkbill);
                                    });
                                  },
                                  child: Text(LocaleKeys.checkBill
                                      .tr(), style: const TextStyle(color: Colors.white)), // <----text of Check bill-----
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
              );
            },
          ),
        );
      },
    );
  }
}
