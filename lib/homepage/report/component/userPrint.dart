import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';

Future UserPrint(BuildContext context) {
  //var orderproviders = context.read<orderprovider>();
 var reportProvider = context.read<ReportProvider>();
  var provide = context.read<getUserProvider>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'User',
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
                      Text("Date: "+ DateTime.now().toString() ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("ຊື້/ນໍາສະກຸນ"),
                      Text("ເພດ"),
                      Text("ຕໍາແໜ່ງ"),
                    
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
                                 child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provide.getUser![index].username,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                provide.getUser![index].address.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                                 Text(
                                provide.getUser![index].phone.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                             
                            ],
                          ),
                              ),
                               Text(provide.getUser![index].gender.toString(),),
                              Text(provide.getUser![index].status.toString(), style: TextStyle(color: Colors.green),),
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
        ),
      );
    },
  );
}
