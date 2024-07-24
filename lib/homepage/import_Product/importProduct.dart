import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproject/homepage/addproduct/component/title.dart';
import 'package:myproject/homepage/addproduct/cubit/addproduct_cubit.dart';
import 'package:myproject/homepage/import_Product/component/TextField.dart';
import 'package:myproject/homepage/import_Product/cubit/import_product_cubit.dart';
import 'package:myproject/homepage/import_Product/provider/provider.dart';

class ImportProduct extends StatefulWidget {
  const ImportProduct({super.key});
  @override
  State<ImportProduct> createState() => _ImportProductState();
}

 TextEditingController price_qtyController = TextEditingController();
class _ImportProductState extends State<ImportProduct> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImportProductCubit, ImportProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
       var cubit = context.read<ImportProductCubit>();
       var provider = context.read<ImpProduct>();
        return Scaffold(
          appBar: AppBar(
            title: Text("import product"),
          ),
          body: Container(
            child: Form(
              key: cubit.formkey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                          
                          ],
                        ),
                      ),
                      Divider(),
                      TextMess(
                        texts: 'ລະຫັດສີນຄ້າ',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: cubit.ProdcutId,
                               onChanged: (value) {
                                cubit.selectOrderporduct();
                               },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: "ລະຫັດສີນຄ້າ"),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 46,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.red),
                              child: Icon(
                                Icons.qr_code_scanner_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextMess(
                        texts: 'ຊື່ສິນຄ້າ',
                      ),
                      TextFeildss(hintext: "ຊື່ສິນຄ້າ", controller: cubit.ProductName, enable: false,),
                      TextMess(
                        texts: 'ລາຄາ',
                      ),
                       TextFeildss(
                        controller: cubit.BuyPriceProduct,
                        hintext: 'ລາຄາ', enable: false,
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      TextMess(
                        texts: 'ຈໍານວນ',
                      ),
                      Padding(
                        padding:  EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                               controller: cubit.ProductQty,
                               onChanged: (value) {
                                 if (value.isNotEmpty) {
                                   setState(() {
                                     cubit.BuyPriceProduct.text = (provider.getImportProduct.orCost *int.parse(value)).toString(); // here is to set  if the qty have change then collect the qty to show in the price
                                   });
                                 }else{
                                  cubit.BuyPriceProduct.text = 0.toString();
                                 }
                               },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: "ຈໍານວນ"),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                            cubit.updateproductquantity();
                              },
                              child: Container(
                                height: 46,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
