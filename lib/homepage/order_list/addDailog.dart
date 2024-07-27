// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/report/providerReport.dart';

Future test(BuildContext context) {
  //var orderproviders = context.read<orderprovider>();
  var reportProvider = context.read<ReportProvider>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Order Detail',
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
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Order Id:  ${reportProvider.getorderlistReport.orId}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Date: ${reportProvider.getorderlistReport.orDate}"),
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Description"),
                    Text("Qty"),
                    Text("Amount "),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: List.generate(
                      reportProvider.selectOrderDetailReport!.length, (index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(reportProvider
                              .selectOrderDetailReport![index].productName),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${reportProvider
                                      .selectOrderDetailReport![index].amount} Kip"),
                              const SizedBox(
                                width: 40,
                              ),
                              Text(reportProvider
                                  .selectOrderDetailReport![index].qty
                                  .toString()),
                            ],
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Text("${reportProvider
                                    .selectOrderDetailReport![index].amount} Kip"),
                          ),
                          onTap: () {
                            // do something when the tile is tapped
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(""),
                    const Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("${reportProvider.getorderlistReport.orAmount} Kip"),
                  ],
                ),
              ),
              const Divider(),
              const Text("thank you! Visit again"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceAround,
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
                )
              
              ),
            ],
          ),
        ),
      );
    },
  );
}
