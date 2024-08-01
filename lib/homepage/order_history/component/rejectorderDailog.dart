// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, deprecated_member_use, file_names


import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';


Future RejectOrder(BuildContext context) {
  var provide = context.read<kitchenProvider>();
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
                    'ລາຍການທີ່ຖືກປະຕິເສດ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.table_bar,
                        color: Colors.red,
                        size: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          provide.getrejectorder[0].tableId.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                   
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Text("Date: " + _currentDateTime),
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
                      Text("ຊື້ອາຫານ"),
                      Text("ຈໍານວນ "),
                   
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: Builder(builder: (context) {
                   
                    return ListView(
                      children: List.generate(provide.getrejectorder.length,
                          //   orderproviders.selectorderdata!.length,
                          (index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text((index + 1).toString()),
                                  Text(provide.getrejectorder[index].productName),
                                  Text(provide.getrejectorder[index].qty
                                      .toString()),
                                 
                                ],
                              ),
                            ),
                            const DottedLine(
                              //<---this is make draw the dotted line
                              dashGapLength: 5,
                              dashLength: 5,
                              dashColor: Colors.black,
                            ),
                          ],
                        );
                      }),
                    );
                  }),
                ),
               
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        child: const Text('ກັບຄືນ', style: TextStyle(color: Colors.red),),
                        onPressed: () {
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
}
