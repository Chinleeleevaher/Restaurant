// ignore_for_file: file_names

import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/kitchen/cubit/kitchen_cubit.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';
import 'package:myproject/homepage/orderproduct/cubit/order_product_cubit.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class KitchenOrderList extends StatefulWidget {
  const KitchenOrderList({super.key});

  @override
  State<KitchenOrderList> createState() => _KitchenOrderListState();
}

class _KitchenOrderListState extends State<KitchenOrderList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KitchenCubit, KitchenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Consumer<kitchenProvider>(
          builder: (context, provider, widget) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("List Bill"),
                actions: [
                  Consumer<kitchenProvider>(
                    builder: (context, reject, child) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: badges.Badge(
                          badgeAnimation: const BadgeAnimation.rotation(
                            animationDuration: Duration(seconds: 1),
                            colorChangeAnimationDuration: Duration(seconds: 1),
                            loopAnimation: false,
                            curve: Curves.fastOutSlowIn,
                            colorChangeAnimationCurve: Curves.easeInCubic,
                          ),
                          badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
                          position: BadgePosition.topEnd(top: -1, end: -1),
                          badgeContent: Text(
                            state.listOrder!.length.toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.notification_add),
                            onPressed: () {
                              navService.pushNamed(AppRount.kitchen);
                            },
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
              body: Builder(
                builder: (context) {
                  if (state.status == OrderProductStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  }

                  if (provider.getOrderlist == null || provider.getOrderlist!.isEmpty) {
                    return const Center(
                      child: Text("ບໍ່ມີຂໍໍ້ມູນ"),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.getOrderlist!.length,
                    itemBuilder: (context, index) {
                      var orderlist = provider.getOrderlist![index];
                      DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');

                      // Ensure orpDate is a DateTime object
                      DateTime orpDate;
                      if (orderlist.orDate is String) {
                        orpDate = DateTime.parse(orderlist.orDate as String);
                      } else {
                        orpDate = orderlist.orDate;
                      }

                      // Format the date
                      String formattedDate = formatter.format(orpDate);

                      return GestureDetector(
                        onTap: () async {
                          // Handle tap event, e.g., navigate to detailed view
                          // await cubits.ontypeselectBillid(orderlist.billnumber);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          elevation: 2,  // Optional: Adds shadow to the card for better UI
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8), // Add spacing between elements
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Order ID: ${orderlist.orId}',
                                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const VerticalDivider(width: 20,),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    formattedDate,
                                    style: const TextStyle(color: Colors.black54),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const VerticalDivider(width: 20,),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    orderlist.orStatus == 2
                                        ? 'ສໍາເລັດ' // Translation might be applied if necessary
                                        : orderlist.orStatus == 1
                                            ? 'ອໍເດີເຂົ້າ'
                                            : ' ຊໍາລະແລ້ວ',
                                    style: TextStyle(
                                      color: orderlist.orStatus == 0
                                          ? Colors.green
                                          : orderlist.orStatus == 2
                                              ? Colors.grey
                                              : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
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
            );
          },
        );
      },
    );
  }
}
