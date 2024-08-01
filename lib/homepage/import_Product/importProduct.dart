// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/homepage/import_Product/cubit/import_product_cubit.dart';
import 'package:myproject/homepage/import_Product/provider/provider.dart';

class ImportProduct extends StatefulWidget {
  const ImportProduct({super.key});

  @override
  State<ImportProduct> createState() => _ImportProductState();
}

class _ImportProductState extends State<ImportProduct> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImportProductCubit, ImportProductState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        var cubit = context.read<ImportProductCubit>();
        var provider = context.read<ImpProduct>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Import Product"),
          ),
          body: Form(
            key: cubit.formkey,
            child: Column(
              children: [
                // Product ID Input and QR Scanner Button
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: cubit.BillNumber,
                          onChanged: (value) {
                            cubit.selectOrderporduct();
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "ລະຫັດບິນສັ່ງຊື້",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Add QR code scanning functionality here
                        },
                        child: Container(
                          height: 46,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red,
                          ),
                          child: const Icon(
                            Icons.qr_code_scanner_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // List of additional product inputs
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.getImportProduct?.length ??
                        0, // Safely access list length
                    itemBuilder: (context, index) {
                      var product = provider.getImportProduct?[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: product?.orpNameController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "ຊື່ສິນຄ້າ",
                                ),
                                readOnly:
                                    true, // This will lock the field but still allow selection
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: product?.orpQtyController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "ຈໍານວນ",
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: product?.orpPriceController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "ຈໍານວນເງີນ",
                                  suffixText:
                                      ' Kip', // Add "Kip" as suffix text
                                  suffixStyle: const TextStyle(
                                      color: Colors
                                          .red), // Optional: style for the suffix text
                                ),
                              //  readOnly: true,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Handle the action for the FAB
              // For example, you might want to validate the form and submit the data
              if (cubit.formkey.currentState?.validate() ?? false) {
                // Form is valid, handle submission
                if (provider.getImportProduct!.isNotEmpty) {
                  cubit.updateproductquantity();
                } else {
                  Fluttertoast.showToast(
                    msg: "ບໍ່ມີຂໍ້ມູນ",
                    gravity: ToastGravity.CENTER,
                  );
                }

                // Replace with the actual submit method
              }
            },
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
            tooltip: 'Submit',
          ),
        );
      },
    );
  }
}
