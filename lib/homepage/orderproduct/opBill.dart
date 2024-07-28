// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/orderproduct/cubit/order_product_cubit.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:provider/provider.dart';

class OrderProductListBill extends StatefulWidget {
  const OrderProductListBill({super.key});

  @override
  State<OrderProductListBill> createState() => _OrderProductListBillState();
}

class _OrderProductListBillState extends State<OrderProductListBill> {
  @override
  Widget build(BuildContext context) {
    var cubits = context.read<OrderProductCubit>();

    return BlocConsumer<OrderProductCubit, OrderProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Consumer<OrderProductProvider>(
          builder: (context, provider, widget) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("List Bill"),
              ),
              body: Builder(
                builder: (context) {
                  if (state.status == OrderProductStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  }

                  if (provider.productListBill == null || provider.productListBill!.isEmpty) {
                    return const Center(
                      child: Text("ບໍ່ມີຂໍໍ້ມູນ"),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.productListBill!.length,
                    itemBuilder: (context, index) {
                      var orderlist = provider.productListBill![index];
                      DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');

                      // Ensure orpDate is a DateTime object
                      DateTime orpDate;
                      if (orderlist.orpDate is String) {
                        orpDate = DateTime.parse(orderlist.orpDate as String);
                      } else {
                        orpDate = orderlist.orpDate;
                      }

                      // Format the date
                      String formattedDate = formatter.format(orpDate);

                      return GestureDetector(
                        onTap: () async {
                          await cubits.ontypeselectBillid(orderlist.billnumber);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Bill: ${orderlist.billnumber}',
                                    style: const TextStyle(color: Colors.red),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                  child: Text(
                                    formattedDate,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const VerticalDivider(),
                                Expanded(
                                  child: Text(
                                    orderlist.status == 2
                                        ? 'ກໍາລັງລໍຖ້າ' // Pending in Lao
                                        : orderlist.status == 0
                                            ? 'ສໍາເລັດ' // Completed in Lao
                                            : 'Unknown',
                                    style: TextStyle(
                                      color: orderlist.status == 2
                                          ? Colors.red
                                          : Colors.green,
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
