
import 'package:flutter/material.dart';
import 'package:myproject/responsives.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({super.key});

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Kitchen"),
            ),
            body: SingleChildScrollView(
              child: Form(
              //  key: cubit.formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                if (Responsive.isMobile(context))
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                           // controller: cubit.productypeName,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 20),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                hintText: "ລາຍການ"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // cubit.adproductype(context);
                                            // if (cubit.isAdd) {
                                            //   if (cubit.productypeName.text
                                            //       .isEmpty) {
                                            //     Fluttertoast.showToast(
                                            //         msg: "pleas enter category",
                                            //         gravity:
                                            //             ToastGravity.CENTER);
                                            //   } else {
                                            //     cubit.adproductype();
                                            //   }
                                            // } else {
                                            //   cubit.updateProduct();
                                            // }
                                          },
                                          child: Container(
                                            height: 46,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.green),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                //  title(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    VerticalDivider(),
                                    Text("ລ/ດ"),
                                    VerticalDivider(),
                                   // Text("ເລກ ID"),
                                    VerticalDivider(),
                                    Text("Name"),
                                    VerticalDivider(),
                                    Text("Edit"),
                                    VerticalDivider(),
                                    Text("Delete"),
                                    VerticalDivider(),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                //     detail(),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: List.generate(
                                              4,
                                              (i) {
                                            // var prolist = state.listproduct;
                                            //  var pro = State.provider;
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, bottom: 3),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, left: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      // child: Text(prolist![i].productName),
                                                      // child: Text(provider
                                                      //     .geproducttype![i]
                                                      //     .protypeId
                                                      //     .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 40),
                                                      // child: Text(prolist[i].price.toString()),
                                                      // child: Text(provider
                                                      //     .geproducttype![i]
                                                      //     .protypeName),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // cubit.onTypeSelectproduct(prolist[i]);
                                                          // cubit.isAdd = false;
                                                          // cubit.onTypeCate(provider
                                                          //     .geproducttype![i]);
                                                        },
                                                        child: Icon(Icons.edit),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // cubit.deleteCategpry(
                                                          //     provider
                                                          //         .geproducttype![
                                                          //             i]
                                                          //         .protypeId);
                                                          // cubit.deletepro(int.parse(prolist[i].productId));
                                                        },
                                                        child:
                                                            Icon(Icons.delete),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                        // other widgets here
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // if (!Responsive.isMobile(context))
                          //   SizedBox(width: 16),
                          // // On Mobile means if the screen is less than 850 we don't want to show it
                          // if (!Responsive.isMobile(context)) textbuttom()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
    
  }
}