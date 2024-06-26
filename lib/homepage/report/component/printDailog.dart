import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/report/providerReport.dart';

Future printdailog(BuildContext context) {
  //var orderproviders = context.read<orderprovider>();
 var reportProvider = context.read<ReportProvider>();
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
                  'Order',
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
                      child: Text("Naban Restautrant"),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Date: " ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("ລ/ດ"),
                    Text("ເລກບິນ"),
            
                    Text("ຈໍນນວນ "),
                    Text("ລາຄາ"),
                    Text("ຈ່າຍ"),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: ListView(
                  children: List.generate(
                      reportProvider.orderReport!.length, (index) {
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
                            
                            Text(reportProvider.orderReport![index].orId.toString()),
                          
                            Text(reportProvider.orderReport![index].orQty.toString()),
                          
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(reportProvider.orderReport![index].orAmount.toString()),
                            ),
                            
                            Text(reportProvider.orderReport![index].payment, style: TextStyle(color: Colors.green),),
                            
                          ],
                         ),
                       )
                      ],
                    );
                  }),
                ),
              ),
         
              Divider(),
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceAround,
                  children: [
                      ElevatedButton(
                  child: Text('wait'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                     ElevatedButton(
                  child: Text('print'),
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
