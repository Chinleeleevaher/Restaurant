import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';

class CheckBill_Page extends StatefulWidget {
  const CheckBill_Page({Key? key}) : super(key: key);

  @override
  State<CheckBill_Page> createState() => _CheckBill_PageState();
}

class _CheckBill_PageState extends State<CheckBill_Page> {
  int?
      _selectedRadio; // Declare a variable to hold the selected radio button value
  String _currentDateTime = '';

  @override
  void initState() {
    super.initState();
    _getCurrentDateTime();
  }

  void _getCurrentDateTime() {
    setState(() {
      _currentDateTime = DateFormat('yyyy hh:mm:ss a').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    var tableprovi = context.read<tableProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Text("Chen Bill"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, right: 10, left: 10),
        child: ListView(
          children: [
            Text(
              "Table",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tableprovi.tablenumber,
                  style: TextStyle(color: Colors.red),
                ),
                Text(_currentDateTime,
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(" ເລກທີ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("123456", style: TextStyle(color: Colors.red)),
            SizedBox(
              height: 20,
            ),
            Text(" ປະເພດການຈ່າຍ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio(
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                  },
                ),
                Text("cash"),
                SizedBox(
                  width: 25,
                ),
                Radio(
                  value: 2,
                  groupValue: _selectedRadio,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                  },
                ),
                Text("transfer"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(" ລາຄາທັງໝົດ", style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                "1250000 Kip",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("ຖອນເງີນ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
            Text("ຮັບເງີນ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("ພິມບິນ"),
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
              onPressed: () {},
              child: Text("ຈ່າຍເງີນ"),
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
  }
}
