import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/homepage/orderproduct/component/billDailog.dart';
import 'package:myproject/homepage/orderproduct/component/listDailog.dart';
import 'package:myproject/homepage/orderproduct/cubit/order_product_cubit.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:provider/provider.dart';

class order_product extends StatefulWidget {
  const order_product({super.key});

  @override
  State<order_product> createState() => _order_productState();
}

class _order_productState extends State<order_product> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderProductCubit, OrderProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubits = context.read<OrderProductCubit>();
        var provider = context.read<OrderProductProvider>();
        return Scaffold(
            appBar: AppBar(
              title: const Text("Order Product"),
              actions: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          listdailog(context);
                        },
                        child: Icon(Icons.list)),
                    )
                  ],
                )
              ],
            ),
            body: ListView(
              children: [
                Column(
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
                      child: const Expanded(
                        child: Row(
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
                            Text("       ຈັດການ     "),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: SizedBox(
                        // height: 500,
                        // width: 550,
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 2,
                        // decoration: BoxDecoration(color: Colors.white),
                        child: Builder(builder: (context) {
                          
                          if (state.status == OrderProductStatus.loading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            );
                          }
                          if (provider.getproductOrder!.isEmpty) {
                            return const Center(
                              child: Text("Chose the date you want to show"),
                            );
                          }
                          return Column(
                            children: List.generate(
                                provider.getproductOrder!.length, (index) {
                              return Card(
                                child: GestureDetector(
                                  onTap: () {
                                    //    cubit.getorderdetail(orderlist);
                                  },
                                  child: InkWell(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          // leading: Text((index + 1).toString()),
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: GestureDetector(
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
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cubits.ontype(provider
                                                        .getproductOrder![index]
                                                        .productId);
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.green,
                                                ),
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
                    Container(
                        height: 170,
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
                            const SizedBox(
                              height: 10,
                            ),

                            Text.rich(
                              TextSpan(
                                text: "ລາຄາ :     " +
                                    provider.totalprice
                                        .toString(), // <----text of total price
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),

                                children: const <TextSpan>[
                                  TextSpan(
                                    text: "    ກີບ ", // here of total price
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
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                        "ຍົກເລີກ"), // <----text of Check Cencel-----
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (cubits.provider.totalprice != 0) {
                                        cubits.PostOrderProduct();
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please Select the product first",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 12.0);
                                      }
                                    }, // <----text of Check bill-----
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    child: const Text(
                                      "ສັ່ງຊື້",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ));
      },
    );
  }
}
