import 'package:flutter/material.dart';
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
      
      },
      builder: (context, state) {
        var cubit = context.read<KitchenCubit>();
        return Scaffold(
            appBar: AppBar(
              title: const Text("Kitchen"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            cubit.SelectorderbyOrderStatus();
                          },
                          child: const Icon(Icons.refresh_outlined))
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
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  const Row(
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
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  //     detail(),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Column(
                                            children: List.generate(
                                                state.listOrder!.length, (i) {
                                              return Container(
                                                margin: const EdgeInsets.only(
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
                                                        child: Text("OrID ${state.listOrder![i]
                                                                .orId}"),
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
                                                            
                                                          },
                                                          child: state.loadBillStatus ==
                                                                  statuslist
                                                                      .loading
                                                              ? const CircularProgressIndicator()
                                                              : const Icon(
                                                                  Icons.check),
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
