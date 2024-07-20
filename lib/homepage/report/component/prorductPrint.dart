import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/report/providerReport.dart';

Future productPrint(BuildContext context) {
  var Repotprovider = context.read<ReportProvider>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Product',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.restaurant,
                        color: Colors.red,
                        size: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Naban Restautrant"),
                      ),
                      Text(""),
                    ],
                  ),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Date: ${DateTime.now()}"),
                    ],
                  ),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("ລ/ດ"),
                      VerticalDivider(),
                      Text("ລາຍການ"),
                      VerticalDivider(),
                      Text("ທັງໝົດ"),
                      VerticalDivider(),
                      Text("ຂາຍອອກ"),
                      VerticalDivider(),
                      Text("ຍັງເຫຼືອ"),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView(
                    children: List.generate( Repotprovider.AllcollectReport!.length,
                        (index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text((index + 1).toString()),
                                ),
                                Text(Repotprovider.AllcollectReport![index].productName
                                    .toString()),
                                Text(Repotprovider.AllcollectReport![index].protypeId
                                    .toString()),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(Repotprovider
                                      .AllcollectReport![index].productId
                                      .toString()),
                                ),
                                Text(
                                  Repotprovider.AllcollectReport![index].quantity.toString(),
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          child: const Text('wait'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: const Text('print'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    },
  );
}
