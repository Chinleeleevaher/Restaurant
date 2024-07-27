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
   // var provider = context.read<OrderProductProvider>();
    var cubits = context.read<OrderProductCubit>();

    return BlocConsumer<OrderProductCubit, OrderProductState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        return Consumer<OrderProductProvider>(builder: (context, provider, widget)  { //....here iss to make access to the provider
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
                      child: Text("ບໍ່ມີຂໍ້ມູນ"),
                    );
                  }
            
                  return ListView.builder(
                    itemCount: provider.productListBill!.length,
                    itemBuilder: (context, index) {
                      var orderlist = provider.productListBill![index];
                      DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm'); // Format for displaying the date
            
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
                        onTap: ()async {
                         await cubits.ontypeselectBillid(orderlist.billnumber);
                        
                        
                        },
                        child: Card(
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text((index + 1).toString()),
                                const VerticalDivider(),
                                Text(
                                  "Bill: ${orderlist.billnumber}",
                                  style: const TextStyle(color: Colors.red),
                                ),
                                const VerticalDivider(),
                                Text(formattedDate),
                                const VerticalDivider(),
                                Text(
                                  orderlist.status == 2
                                      ? 'ກໍາລັງລໍຖ້າ' // Done in Lao
                                      : orderlist.status == 0
                                          ? 'ສໍາເລັດ'
                                          : 'Unknown',
                                  style: TextStyle(
                                    color: orderlist.status == 2
                                        ? Colors.red
                                        : Colors.green,
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
          }
        );
      },
    );
  }
}
