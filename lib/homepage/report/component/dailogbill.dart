import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/order/provider.dart';

Future simpledailog(BuildContext context) {
  var orderproviders = context.read<orderprovider>();
  return showDialog(
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
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Order Detail',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("BM Restautrant"),
                    ),
                    Text(""),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Order Id:  " +
                        (orderproviders.getorderlistReport.orId.toString())),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Date: " +
                        orderproviders.getorderlistReport.orDate.toString()),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      orderproviders.selectOrderDetailReport!.length, (index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(orderproviders
                              .selectOrderDetailReport![index].productName),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(orderproviders
                                      .selectOrderDetailReport![index].price
                                      .toString() +
                                  " Kip"),
                              SizedBox(
                                width: 40,
                              ),
                              Text(orderproviders
                                  .selectOrderDetailReport![index].qty
                                  .toString()),
                            ],
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Text(orderproviders
                                    .selectOrderDetailReport![index].amount
                                    .toString() +
                                " Kip"),
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
                    Text(""),
                    Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(orderproviders.getorderlistReport.orAmount.toString() +
                        " Kip"),
                  ],
                ),
              ),
              Divider(),
              Text("thank you! Visit again"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
