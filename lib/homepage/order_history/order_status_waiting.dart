import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_history/component/rejectorderDailog.dart';
import 'package:myproject/homepage/order_history/cubit/orderstatus_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

const List<Color> _kDefaultRainbowColors = [
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
    var provide = context.read<kitchenProvider>();
    return BlocConsumer<OrderstatusCubit, OrderstatusState>(
      listener: (context, state) {},
      builder: (context, state) {
        context.read<OrderstatusCubit>();
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
                        height: 15,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text(
                            tableprovide.tablenumber.toString(),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      ////...............
                      const SizedBox(
                        width: 20,
                      ),
                      Consumer<kitchenProvider>(
                          // // <----here is to make notifier for reject order.......
                          builder: (context, reject, child) {
                        return badges.Badge(
                          badgeAnimation: const BadgeAnimation.rotation(
                            animationDuration: Duration(seconds: 1),
                            colorChangeAnimationDuration: Duration(seconds: 1),
                            loopAnimation: false,
                            curve: Curves.fastOutSlowIn,
                            colorChangeAnimationCurve: Curves.easeInCubic,
                          ),
                          badgeStyle:
                              const badges.BadgeStyle(badgeColor: Colors.white),
                          position: BadgePosition.topEnd(top: -1, end: -1),
                          badgeContent: Text(
                            reject.getrejectorder.length.toString(),
                            // cubit.state.coppywith(orderproduct_c:),
                            style: const TextStyle(color: Colors.red),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.notification_add,
                            ),
                            onPressed: () {
                              if (provide.getrejectorder.isNotEmpty) {
                                RejectOrder(context);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "ບໍ່ມີຂໍ້ມູນ",
                                    gravity: ToastGravity.CENTER);
                              }
                            },
                          ),
                        );
                      }),
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
                  const SizedBox(
                    height: 50,
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballBeat,
                        colors: _kDefaultRainbowColors,
                        strokeWidth: 4,
                        backgroundColor: Color.fromRGBO(254, 247, 255, 1),
                        pathBackgroundColor: Colors.black),
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
                                              "${list[i].price} Kip  ",
                                              style: const TextStyle(
                                                  color: Colors.red),
                                            ),
                                            const SizedBox(
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
                                          "${list[i].amount} Kip  ",
                                          style: const TextStyle(
                                              color: Colors.red),
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
