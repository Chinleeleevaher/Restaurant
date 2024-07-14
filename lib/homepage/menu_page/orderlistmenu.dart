import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/menu_page/cubit/menu_cubit.dart';
import 'package:myproject/homepage/menu_page/menuProvider.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_list/addDailog.dart';
import 'package:myproject/homepage/order_list/cubit/order_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:provider/provider.dart';

import '../../login/home_provider/provider.dart';

class OrderListMenu extends StatefulWidget {
  const OrderListMenu({super.key});

  @override
  State<OrderListMenu> createState() => _OrderListMenuState();
}

//############### this page i refer to the order cubit ###############################
//++++++++++++++  the every thing are same and the diferent is i cahnge to collect in diferent model as
// ===>>  List<OrderproductModelMenu> for order from menu and ===>>> List<OrderproductModel> for from order
class _OrderListMenuState extends State<OrderListMenu> {
  @override
  Widget build(BuildContext context) {
    var orderlist = context.read<tableprovide>();
    var tableprovid = context.read<tableProvider>();

    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<OrderCubit>();
        var prov = context.read<tableProvider>();
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text("Order"),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "table: ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 15,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            tableprovid.tname
                                .toString(), // Replace 'Default Text' with your desired default value if both are empty
                            style: TextStyle(fontSize: 10, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            navService.pushNamed(AppRount.menupage);
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ))
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
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("ລ/ດ"),
                      VerticalDivider(),
                      Text("ລາຍການ"),
                      VerticalDivider(),
                      Text("ຈໍານວນ"),
                      VerticalDivider(),
                      Text("ທັງໝົດ"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: // orderlist.orderlist.productId != null && orderlist.orderlist.productId.isNotEmpty?
                    ListView.builder(
                        itemCount: orderlist.getorderlist.length,
                        itemBuilder: (c, i) {
                          var list = orderlist.getorderlist;
                          final TextEditingController orqty =
                              TextEditingController(
                                  text: list[i].qty.toString());

                          int currentQty = int.tryParse(orqty.text) ?? 0;

                          return GestureDetector(
                            child: Card(
                              margin:
                                  EdgeInsets.only(bottom: i + 1 == 10 ? 10 : 3),
                              elevation: 1,
                              child: InkWell(
                                onTap: () {
                                  cubit.ontypeOrIDmenu(list[i].productId);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'ເພື່ມ',
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (currentQty > 0) {
                                                        currentQty--; // Increment the quantity
                                                        orqty.text = currentQty
                                                            .toString(); // Update the text in TextEditingController
                                                      }
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: TextField(
                                                    controller: orqty,
                                                    enabled: false,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      // Get current quantity as integer
                                                      if (currentQty > 0) {
                                                        currentQty++; // Increment the quantity
                                                        orqty.text = currentQty
                                                            .toString(); // Update the text in TextEditingController
                                                      }
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ຍົກເລີກ'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  cubit.ontyepQtymenu(
                                                      currentQty);
                                                  MyProgress().loadingProgress(
                                                      context: context,
                                                      title: 'Updating');
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 1));
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                  navService.pushNamed(AppRount
                                                      .OrderListMenus); //...here is just make reflesh after i delete the order list
                                                },
                                                child: Text('ບັນທືກ'),
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  );
                                  ;
                                },
                                child: Dismissible(
                                  key: Key("1"), // <--here is to make key
                                  direction: DismissDirection.startToEnd,
                                  background: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  confirmDismiss: (direction) {
                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                              title: Text('ລຶບລາຍການ'),
                                              content: const Text(
                                                  'ເຈົ້້າຕ້ອງການລຶບແທ້ບໍ່?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () async {
                                                    cubit.ontypeorderidmenu(
                                                        list[i].productId);
                                                    Navigator.pop(
                                                        context, false);
                                                    navService.pushNamed(AppRount
                                                        .OrderListMenus); //...here is just make reflesh after i delete the order list
                                                  },
                                                  child: const Text('ແມ່ນ'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    // Close the dialog box
                                                    Navigator.pop(
                                                        context, false);
                                                  },
                                                  child: Text('ບໍ່'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Expanded(
                                    child: ListTile(
                                      leading: Text((i + 1).toString()),
                                      title: Text(list[i].productName),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            (list[i].price).toString() +
                                                " Kip  ",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text(list[i].qty.toString()),
                                        ],
                                      ),
                                      trailing: Text(
                                        (list[i].price * list[i].qty)
                                                .toString() +
                                            " Kip  ",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
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
                              text: orderlist.totalprice.toString() +
                                  " Kip", // here of total price
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("ຢືນຢັ້ນ"),
                                      content:
                                          Text("ທ່ານຕ້ອງການຍົກເລືກແທ້ບໍ່?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            "ບໍ່",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                        ),
                                        TextButton(
                                          child: Text("ແມ່ນ"),
                                          onPressed: () {
                                            orderlist
                                                .clearorderlist(); // to make clear the product list
                                            prov.clearttID();
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            navService
                                                .pushNamed(AppRount.menupage);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "ຍົກເລີກ",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (orderlist.getorderlist.isEmpty) {
                                  Fluttertoast.showToast(
                                    msg: "ກາລຸນາເລືອກເມນູກ່ອນ",
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.grey[700],
                                  );
                                } else {
                                  cubit.updatetableStatetu();
                                }
                              },
                              child: Text(
                                "ສັ່ງຊື້",
                                style: TextStyle(color: Colors.white),
                              ),
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
