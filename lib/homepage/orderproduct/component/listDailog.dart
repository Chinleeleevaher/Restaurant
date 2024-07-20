import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/orderproduct/cubit/order_product_cubit.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:provider/provider.dart';

Future listdailog(BuildContext context) {
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
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Date: " + formattedDate),
                   
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("ລະຫັດສີນຄ້າ"),
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
                            Text(provider.collectproductOrder![index].productId.toString()),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(provider.collectproductOrder![index].orpName.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(provider.collectproductOrder![index].orpQty.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(provider.collectproductOrder![index].orpPrice.toString() + " Kip"),
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
                   Text("ລາຄາທັງໝົດ : " + provider.listTotalPrice.toString() + "  ກີບ")
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
