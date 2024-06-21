import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/kitchen/cubit/kitchen_cubit.dart';
import 'package:myproject/responsives.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({super.key});

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KitchenCubit, KitchenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<KitchenCubit>();
        return Scaffold(
            appBar: AppBar(
              title: Text("Kitchen"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            cubit.SelectorderbyOrderStatus();
                          },
                          child: Icon(Icons.refresh_outlined))
                    ],
                  ),
                )
              ],
            ),
            body: Builder(builder: (context) {
              if (state.status == statuslist.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  if (Responsive.isMobile(context))
                                    SizedBox(
                                      height: 20,
                                    ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      VerticalDivider(),
                                      Text("ລ/ດ"),
                                      VerticalDivider(),
                                      // Text("ເລກ ID"),
                                      VerticalDivider(),
                                      Text("ລະຫັດສີນຄ້າ"),
                                      VerticalDivider(),
                                      Text("ຈໍານວນ"),
                                      VerticalDivider(),
                                      Text("ລາຍລະອຽດ"),
                                      VerticalDivider(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  //     detail(),
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Column(
                                            children: List.generate(
                                                state.listOrder!.length, (i) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 3),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8, left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 10),
                                                        child: Text(
                                                            (i + 1).toString()),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 10),
                                                        child: Text("OrID " +
                                                            state.listOrder![i]
                                                                .orId
                                                                .toString()),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 20),
                                                        child: Text(state
                                                            .listOrder![i].orQty
                                                            .toString()),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 15),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            await cubit
                                                                .ontypeSelect(
                                                                    state.listOrder![
                                                                        i]);

                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Dialog(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.8,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <Widget>[
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            'Bill',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              Icon(
                                                                                Icons.table_bar,
                                                                                color: Colors.red,
                                                                                size: 50,
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 20),
                                                                                child: Text(
                                                                                  state.listOrder![i].tableId.toString(),
                                                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                                                                ),
                                                                              ),
                                                                              Text(""),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 8),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              // Text("Bill No:  " +
                                                                              //     "VT" +
                                                                              //     tableprovi.tablenumber),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 8),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              // Text("Date: " + _currentDateTime),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Divider(),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              right: 8,
                                                                              left: 8),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              Text("ລ/ດ"),
                                                                              Text("ຊື້ອາຫານ"),
                                                                              Text("ຈໍານວນ "),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Divider(),
                                                                        Expanded(
                                                                          child:
                                                                              ListView(
                                                                            children: List.generate(state.listOrderdetail!.length,
                                                                                //   orderproviders.selectorderdata!.length,
                                                                                (index) {
                                                                              return Column(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text((index + 1).toString()),
                                                                                        Text(state.listOrderdetail![index].productName),
                                                                                        Text(state.listOrderdetail![index].qty.toString()),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  DottedLine(
                                                                                    //<---this is make draw the dotted line
                                                                                    dashGapLength: 5,
                                                                                    dashLength: 5,
                                                                                    dashColor: Colors.black,
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              20),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              Text(
                                                                                "ຈໍານວນທັງໝົດ:",
                                                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 30),
                                                                                child: Text(state.listOrder![i].orQty.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Divider(),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              ElevatedButton(
                                                                                child: Text('wait'),
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                              ),
                                                                              ElevatedButton(
                                                                                child: Text('Print'),
                                                                                onPressed: () {
                                                                                  cubit.getupdateTableStatus_orStatus();
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child:
                                                              Icon(Icons.check),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                          // other widgets here
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
      },
    );
  }
}
