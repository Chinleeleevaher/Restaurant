import 'dart:developer';

import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/check_bill/cubit/checkbill_cubit.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/table_page.dart';

class CheckBill_Page extends StatefulWidget {
  const CheckBill_Page({Key? key}) : super(key: key);

  @override
  State<CheckBill_Page> createState() => _CheckBill_PageState();
}

class _CheckBill_PageState extends State<CheckBill_Page> {
// Declare a variable to hold the selected radio button value
  String _currentDateTime =
      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _getCurrentDateTime();
    gettotal();
  }

  void _getCurrentDateTime() {
    setState(() {
      _currentDateTime;
    });
  }

  // TextEditingController getmoney = TextEditingController();
  // TextEditingController backmoney = TextEditingController();

  /// ---here is just to get the value of total price
  double total = 0.0;
  gettotal() {
    var orderproviders = context.read<orderprovider>();
    log("test" + orderproviders.totalprice.toString());
    setState(() {
      total = orderproviders.selectorderdata![0].orAmount.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    var tableprovi = context.read<tableProvider>();
    var orderproviders = context.read<orderprovider>();
    return BlocConsumer<CheckbillCubit, CheckbillState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<CheckbillCubit>();

        coculate() {
          ///  <----this is a fucntion to make coculate
          cubit.backmoney.text =
              (total - double.parse(cubit.getmoney.text)).toString();
        }

        coculates() {
          // <---this fuction i use to make change the value in the field back money if i delete in gete money fiel then it will change in back money field also
          cubit.backmoney.text = "0.0";
        }

        return Scaffold(
          appBar: AppBar(
            title:
                Text(LocaleKeys.CheckBill.tr()), //<---text of check bill-----
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: ListView(
              children: [
                Text(
                  LocaleKeys.table.tr(), //<---text of table
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tableprovi.tablenumber.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(_currentDateTime,
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(LocaleKeys.billNo.tr(), // <---text of bill no
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("123456", style: TextStyle(color: Colors.red)),
                SizedBox(
                  height: 20,
                ),
                Text(LocaleKeys.paytype.tr(), // <---text of pay type
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Form(
                    key: cubit.formkey,
                    child: Column(
                      children: [
                        FormField<String>(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                          builder: (FormFieldState<String> field) {
                            return Row(
                              children: [
                                Radio<String>(
                                  value:
                                      'cash', // <---here is to set the value as cash it equa to the value of selectedRadio from the cubit
                                  groupValue: cubit.selectedRadio,
                                  onChanged: (value) {
                                    setState(() {
                                      cubit.selectedRadio = value!;
                                      field.didChange(value);
                                    });
                                  },
                                ),
                                Text(LocaleKeys.cash.tr()), //<----text of cash
                                SizedBox(width: 25),
                                Radio<String>(
                                  value: 'transfer',
                                  groupValue: cubit.selectedRadio,
                                  onChanged: (value) {
                                    setState(() {
                                      cubit.selectedRadio = value!;
                                      field.didChange(value);
                                    });
                                  },
                                ),
                                Text(LocaleKeys.transfer
                                    .tr()), //<----text of transfer
                                if (field.errorText != null)
                                  Text(
                                    field.errorText!,
                                    style: TextStyle(color: Colors.red),
                                  ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                LocaleKeys.totalPrice
                                    .tr(), // <---text of total price
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                orderproviders.selectorderdata![0].orAmount
                                        .toString() +
                                    "  Kip",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                LocaleKeys.backmoney
                                    .tr(), // <---text of backmoney
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        TextFormField(
                          controller: cubit.backmoney,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: "0.0",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.attach_money,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                LocaleKeys.getmoney
                                    .tr(), // <----text of get money
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        TextFormField(
                          validator: (value) {
                            // <--- the value is get from the TextFormField what i fill in it same as the formkey
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.enterMoney
                                  .tr(); // <---text of enter money
                            }
                            double? numericValue = double.tryParse(value);
                            if (numericValue == null) {
                              return LocaleKeys.enterMoney
                                  .tr(); // <---text of enter money
                            }
                            if (total - numericValue > 0) {
                              return LocaleKeys.notEnoughMoney
                                  .tr(); // <---text of not enough money
                            }
                            return null;
                          },
                          controller: cubit.getmoney,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "0.0",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                MdiIcons.currencyUsd,
                                size: 24,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            // <---here is make onchange
                            double? enteredValue = double.tryParse(value);
                            if (enteredValue != null) {
                              coculate(); // <---------to make coculate
                            }
                            if (enteredValue == null) {
                              // <---this fuction i use to make change the value in the field back money if i delete in gete money fiel then it will change in back money field also
                              coculates();
                            }
                            log("money : $value");
                          },
                        )
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Bill',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.restaurant,
                                        color: Colors.red,
                                        size: 50,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text("BM Restautrant"),
                                      ),
                                      Text(""),
                                    ],
                                  ),
                                ),
                                Text("Tel: +8562093551639"),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Bill No:  " +
                                          "VT" +
                                          tableprovi.tablenumber.toString()),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Date: " + _currentDateTime),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, left: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Description"),
                                      Text("Qty"),
                                      Text("Amount "),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Expanded(
                                  child: ListView(
                                    children: List.generate(
                                        orderproviders.selectorderdata!.length,
                                        (index) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(orderproviders
                                                .selectorderdata![index]
                                                .productName),
                                            subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  orderproviders
                                                          .selectorderdata![
                                                              index]
                                                          .price
                                                          .toString() +
                                                      " Kip",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                ),
                                                Text(orderproviders
                                                    .selectorderdata![index].qty
                                                    .toString()),
                                              ],
                                            ),
                                            trailing: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10, left: 10),
                                              child: Text(orderproviders
                                                      .selectorderdata![index]
                                                      .amount
                                                      .toString() +
                                                  " Kip"),
                                            ),
                                            onTap: () {
                                              // do something when the tile is tapped
                                            },
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
                                  padding: const EdgeInsets.only(
                                      right: 8, left: 8, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(""),
                                      Text(
                                        "Total:",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        orderproviders
                                                .selectorderdata![0].orAmount
                                                .toString() +
                                            "  Kip",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Icon(
                                  Icons.qr_code,
                                  color: Colors.green,
                                  size: 80,
                                ),
                                Text("thank you! Visit again"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      ElevatedButton(
                                        child: Text('CANCEL'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ElevatedButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          // do something
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
                      Text(LocaleKeys.printBill.tr()), //<----text of print bill
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(150),
                    ),
                    minimumSize: Size(100, 45),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.update_tbOrder();
                  },
                  child: Text(LocaleKeys.pay.tr()), //<----text of pay
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    minimumSize: Size(100, 45),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
