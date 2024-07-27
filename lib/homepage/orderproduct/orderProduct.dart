// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/orderproduct/cubit/order_product_cubit.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';

class OrderProduct extends StatefulWidget {
  const OrderProduct({super.key});

  @override
  State<OrderProduct> createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderProductCubit, OrderProductState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        var cubits = context.read<OrderProductCubit>();
        var provider = context.read<OrderProductProvider>();
        return Scaffold(
            appBar: AppBar(
              title: const Text("Order Product"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      navService.pushNamed(AppRount.opListbill);
                      // listdailog(context);
                    },
                    child: const Icon(Icons.list),
                  ),
                ),
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("ລ/ດ"),
                      VerticalDivider(),
                      Text("ຊື່"),
                      VerticalDivider(),
                      Text("ຈໍານວນ"),
                      VerticalDivider(),
                      Text("ລາຄາ"),
                      VerticalDivider(),
                      Text("ຈັດການ"),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Builder(
                      builder: (context) {
                        if (state.status == OrderProductStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                        }
                        if (provider.getproductOrder!.isEmpty) {
                          return const Center(
                            child: Text("Choose the date you want to show"),
                          );
                        }
                        return ListView.builder(
                          itemCount: provider.getproductOrder!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: GestureDetector(
                                onTap: () {
                                  // cubit.getorderdetail(orderlist);
                                },
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text((index + 1).toString()),
                                            Text(
                                              provider.getproductOrder![index]
                                                  .productName,
                                            ),
                                            Text(
                                              provider.getproductOrder![index]
                                                  .quantity
                                                  .toString(),
                                            ),
                                            Text(
                                              provider.getproductOrder![index]
                                                  .price
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.green),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      cubits.ontypeminus(
                                                          provider
                                                              .getproductOrder![
                                                                  index]
                                                              .productId);
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.minimize_outlined,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      cubits.ontype(provider
                                                          .getproductOrder![
                                                              index]
                                                          .productId);
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
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
                  ),
                ),
                Container(
                  height: 170,
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
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: "ລາຄາ : ${provider.totalprice}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: " ກີບ",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("ຍົກເລີກ"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (cubits.provider.totalprice != 0) {
                                  cubits.generateBillNumber();
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Please Select the product first",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 12.0,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              child: const Text(
                                "ສັ່ງຊື້",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
