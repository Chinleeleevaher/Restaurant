// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:provider/provider.dart';

Future orderPrintDailog(BuildContext context) {
 var provider = context.read<OrderProductProvider>();

 DateTime dateTimes = DateTime.now();
 String formattedDate = DateFormat('dd-MM-yyyy').format(dateTimes);

  return showDialog(
    context: context,
    builder: (BuildContext context) {
       for(int i = 0; i < provider.getproductOrder!.length; i++){
  if(provider.getproductOrder![i].quantity != 0){
   
   
  }

 }
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
                  'List Order Product',
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
                  children: <Widget>[
                  ],
                ),
              ),
             Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Bill Number: ${provider.billNamber}"),
                    Text("Date: $formattedDate"),
                   
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
                    Text("ລາຍການ"),
                    Text("ຈໍນນວນ "),
                    Text("ລາຄາ"),
                  //  Text("ຈ່າຍ"),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: List.generate(
                      provider.collectproductOrder!.length, (index) {
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
                            
                            Text(provider.collectproductOrder![index].orpName.toString()),
                          
                            Text(provider.collectproductOrder![index].orpQty.toString()),
                          
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(provider.collectproductOrder![index].orpPrice.toString()),
                            ),
                            
                          //  Text(reportProvider.orderReport![index].payment, style: TextStyle(color: Colors.green),),
                            
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
                  mainAxisAlignment:  MainAxisAlignment.spaceAround,
                  children: [
                   Text("ລາຄາທັງໝົດ : ${provider.totalprice}  ກີບ")
                  ],
                )
              
              ),
              const Divider(),
            
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
                  child:  const Text('print'),
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
