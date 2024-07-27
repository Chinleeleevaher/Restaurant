// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/homepage/addtable/cubit/addtable_cubit.dart';
import 'package:myproject/homepage/addtable/provider.dart';
import '../../responsives.dart';

class addtable_page extends StatefulWidget {
  const addtable_page({super.key});

  @override
  State<addtable_page> createState() => _addtable_pageState();
}

int? _tableType;

class _addtable_pageState extends State<addtable_page> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddtableCubit, AddtableState>(
      listener: (context, state) {
   
      },
      builder: (context, state) {
        var cubit = context.read<AddtableCubit>();
        var provide = context.read<tableProviderss>();
        return Scaffold(
            appBar: AppBar(
              title: const Text("Add Table"),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: cubit.tableName,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "ຊື່ໂຕະ"),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text("ທົ່ວໄປ"),
                            value: 1,
                            groupValue: _tableType,
                            onChanged: (value) {
                              setState(() {
                                _tableType = value;
                              });
                              cubit.ontypeTabletype(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: const Text("vip"),
                            value: 2,
                            groupValue: _tableType,
                            onChanged: (value) {
                              setState(() {
                                _tableType = value;
                              });
                              cubit.ontypeTabletype(value as int);
                            },
                          ),
                        ),
                      ],
                    ),
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: cubit.tableSize,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 20),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "ຈໍານວນ",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (cubit.isAdd) {
                                              if (cubit.tableName.text.isEmpty &&
                                                  cubit
                                                      .tableSize.text.isEmpty &&
                                                  state.tableType == 0) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "please Enter table name or size",
                                                    gravity:
                                                        ToastGravity.CENTER);
                                              } else {
                                                cubit.adtable();
                                              }
                                            } else {
                                                cubit.updateTable();
                                            }
                                          },
                                          child: Container(
                                            height: 46,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.green),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                // title(),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    VerticalDivider(),
                                    Text("ຊື່"),
                                    VerticalDivider(),
                                    //  Text("ເລກ ID"),
                                    VerticalDivider(),
                                    Text("ປະເພດ"),
                                    VerticalDivider(),
                                    Text("ແກ້ໄຂ"),
                                    VerticalDivider(),
                                    Text("ລົບ"),
                                    VerticalDivider(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                //                 detail(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: List.generate(
                                              provide.getTable!.length, (i) {
                                            // var prolist = state.listproduct;
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  top: 5, bottom: 3),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, left: 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 30),
                                                      child: Text(provide
                                                          .getTable![i]
                                                          .tableName
                                                          .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 40),
                                                      child: Text(
                                                        provide.getTable![i]
                                                                    .tabletypeId ==
                                                                1
                                                            ? "ທົ່ວໄປ"
                                                            : (provide.getTable![i]
                                                                        .tabletypeId ==
                                                                    2
                                                                ? "vip"
                                                                : ""),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 10),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                         cubit.isAdd = false;
                                                          cubit.ontypeUpdate(
                                                              provide.getTable![
                                                                  i]);
                                                        },
                                                        child: const Icon(Icons.edit),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'ຢືນຢັ້ນ'),
                                                                content: const Text(
                                                                    'ຕ້ອງການລົບແທ້ບໍ່'),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    child: const Text(
                                                                        'ຍົກເລີກ'),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(); // Close the dialog
                                                                    },
                                                                  ),
                                                                  TextButton(
                                                                    child: const Text(
                                                                        'ລົບ'),
                                                                    onPressed:
                                                                        () {
                                                                      cubit.ontypeDelete(provide
                                                                          .getTable![
                                                                              i]
                                                                          .tableId);
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(); // Close the dialog
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child:
                                                            const Icon(Icons.delete),
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
                          if (!Responsive.isMobile(context))
                            const SizedBox(width: 16),
                          // On Mobile means if the screen is less than 850 we don't want to show it
                          if (!Responsive.isMobile(context)) const textbuttom()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class title extends StatelessWidget {
  const title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VerticalDivider(),
          Text("ລ/ດ"),
          VerticalDivider(),
          Text("ເລກ ID"),
          VerticalDivider(),
          Text("Name"),
          VerticalDivider(),
          Text("Edit"),
          VerticalDivider(),
          Text("Delete"),
          VerticalDivider(),
        ],
      ),
    );
  }
}

class detail extends StatelessWidget {
  const detail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50, left: 50),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(5, (i) {
                  // var prolist = state.listproduct;
                  return Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            // child: Text(prolist![i].productName),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 40),
                            // child: Text(prolist[i].price.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                // cubit.onTypeSelectproduct(prolist[i]);
                              },
                              child: const Icon(Icons.edit),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                // cubit.deletepro(int.parse(prolist[i].productId));
                              },
                              child: const Icon(Icons.delete),
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
    );
  }
}

class textbuttom extends StatelessWidget {
  const textbuttom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(right: 70),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Add Unit"),
            ),
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
