import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/internet/nointernet.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_history/cubit/orderstatus_cubit.dart';
import 'package:myproject/homepage/order_list/cubit/order_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:provider/provider.dart';

import '../../login/home_provider/provider.dart';


const List<Color> _kDefaultRainbowColors = const [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];
class OrderStatusWaitingPage extends StatefulWidget {
  const OrderStatusWaitingPage({super.key});

  @override
  State<OrderStatusWaitingPage> createState() => _OrderStatusWaitingPageState();
}

class _OrderStatusWaitingPageState extends State<OrderStatusWaitingPage> {
  @override
  Widget build(BuildContext context) {
    var orderlist = context.read<orderprovider>();
    var tableprovide = context.read<tableProvider>();
    return BlocConsumer<OrderstatusCubit, OrderstatusState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<OrderstatusCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: Container(
              child: GestureDetector(
                  onTap: () {
                    //orderlist.clearorderlist();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
            ),
            title: Text(LocaleKeys.orderSelect
                .tr()), //<----text of order select it is on the appbar---
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.table.tr() + " ", // <--- text of table
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 15,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text(
                            tableprovide.tablenumber.toString(),
                            style: TextStyle(fontSize: 10, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          body: Builder(
            builder: (context) {
              if (state.status == selectorderdata.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
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
                  
                    child: LoadingIndicator(
                              indicatorType: Indicator.ballBeat,
                              colors: _kDefaultRainbowColors,
                              strokeWidth: 4,
                              backgroundColor: Colors.white,
                              pathBackgroundColor: Colors.black
                              ),
                  ),
                  SizedBox(
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
                                elevation: 3,
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: ListTile(
                                      leading: Text((i + 1).toString()),
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(list![i].productName),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              (list[i].price).toString() +
                                                  " Kip  ",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Text(list[i].qty.toString()),
                                          ],
                                        ),
                                      ),
                                      trailing: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          (list[i].amount).toString() +
                                              " Kip  ",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
