import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproject/homepage/addproduct/component/protype.dart';
import 'package:myproject/homepage/addproduct/component/textfield.dart';
import 'package:myproject/homepage/addproduct/component/title.dart';
import 'package:myproject/homepage/addproduct/component/unitelement.dart';
import 'package:myproject/homepage/addproduct/cubit/addproduct_cubit.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});
  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  File? image;
  Future pickimage({required AddproductCubit cubit}) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final ImageTemporary = File(image.path);

      setState(() => this.image = ImageTemporary);
      cubit.onTypeSelectimage(ImageTemporary);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future carmera({required AddproductCubit cubitcamera}) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final tempoary = File(image.path);
      setState(() => this.image = tempoary);
      cubitcamera.onTypeSelectimage(tempoary);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddproductCubit, AddproductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<AddproductCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text("Add product"),
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
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: state.typeSelecimage != null &&
                                        state.typeSelecimage!.path.isNotEmpty
                                    ? Image.file(
                                        state.typeSelecimage!,
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      )
                                    : state.imagenetword != null &&
                                            state.imagenetword!.isNotEmpty
                                        ? Image.network(
                                            state.imagenetword!,
                                            width: 160,
                                            height: 160,
                                            fit: BoxFit.cover,
                                          )
                                        : Icon(
                                            Icons.image,
                                            size: 180,
                                            color: Colors.red,
                                          ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => pickimage(cubit: cubit),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.red),
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () => carmera(cubitcamera: cubit),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.red),
                                        child: Icon(
                                          Icons.camera,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
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
                      TextFeilds(
                        controller: cubit.ProductName,
                        hintext: 'ຊື່ສິນຄ້າ',
                      ),
                      TextMess(
                        texts: 'ປະເພດສິນຄ້າ',
                      ),
                      ProtypeElement(),
                      TextMess(
                        texts: 'ຫົວໜ່ວຍ',
                      ),
                      UnitElement(),
                      TextMess(
                        texts: 'ລາຄາຊື້',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: TextField(
                          controller: cubit.BuyPriceProduct,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true), // Allows numbers and decimal point
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')), // Allow only digits and dot
                          ],
                          decoration: InputDecoration(
                            hintText:
                                'ລາຄາຊື້', // Placeholder text when the field is empty
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      TextMess(
                        texts: 'ລາຄາຂາຍ',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: TextField(
                          controller: cubit.SalePriceProduct,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true), // Allows numbers and decimal point
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]')), // Allow only digits
                          ],
                          decoration: InputDecoration(
                            hintText:
                                'ລາຄາຂາຍ', // Placeholder text when the field is empty
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
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
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: TextField(
                              controller: cubit.ProductQty,
                              keyboardType: TextInputType
                                  .number, // This is optional, but it sets the keyboard to show numbers
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter
                                    .digitsOnly // Allow only digits (0-9)
                              ],
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "ຈໍານວນ",
                              ),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (cubit.productmodel == null) {
                                  cubit.adproduct(context);
                                } else {
                                  cubit.updateProduct(context);
                                }
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
