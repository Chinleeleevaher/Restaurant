import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/product_page/cubit/products_cubit.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<ProductsCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text("Add product"),
            actions: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () => cubit.getproduct(),
                  child: Row(
                    children: [
                      Icon(Icons.restart_alt_outlined),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                          onTap: () =>
                              navService.pushNamed(AppRount.addproduct),
                          child: Icon(Icons.add))
                    ],
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text(
                    "ປະເພດສີນຄ້າ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 360,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 251, 249, 249),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: cubit.state.listproducttype!
                            .length, //cubit.state.listproductype!.length,
                        itemBuilder: (c, i) {
                          var list = state.listproducttype;
                          Color _containercolor = Colors.white;
                          Color _textcolor = Colors.red;
                          if (state.listproducttype![i] == state.typeSelect) {
                            _containercolor = Colors.red;
                            _textcolor = Colors.white;
                          }
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                cubit.onTypeSelectprotype(list[i]);
                                //// <--here is to make ontap and select in productype
                                //   _containercolor = cubit.changeColor(Colors.white);
                              },
                              child: Container(
                                height: 8,
                                width: 80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 5),
                                        color: Color.fromARGB(77, 219, 216, 216)
                                            .withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: _containercolor),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    list![i].protypeName.toString(),
                                    // list![i].protypeName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: _textcolor),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text(
                    "ຫົວໜ່ວຍ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 360,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 251, 249, 249),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: cubit.state.listunit!
                            .length, //cubit.state.listproductype!.length,
                        itemBuilder: (c, i) {
                          var listunit = state.listunit;
                          Color _textcolor = Colors.red;
                          Color _containercolor = Colors.white;
                          if (state.listunit![i] == state.typeSelectunit) {
                            _containercolor = Colors.red;
                            _textcolor = Colors.white;
                          }
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                cubit.onTypeSelectunit(listunit[i]);
                              },
                              child: Container(
                                height: 8,
                                width: 80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 5),
                                        color: Color.fromARGB(77, 219, 216, 216)
                                            .withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: _containercolor),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    listunit![i].unitName.toString(),
                                    // list![i].protypeName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: _textcolor),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 360,
                height: 50,
                decoration: BoxDecoration(color: Colors.green),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("ລ/ດ"),
                    Text("ສີນຄ້າ"),
                    Text("ປະເພດ/ຫົວໜ່ອຍ"),
                    Text("ຈັດການ"),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 360,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children:
                            List.generate(cubit.state.listproduct!.length, (i) {
                          var prolist = state.listproduct;
                          return Container(
                            height: 50,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 3, bottom: 3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                        prolist![i].image,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(prolist![i].productName),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Text(prolist[i].price.toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                      onTap: () {
                                        cubit.onTypeSelectproduct(prolist[i]);
                                      },
                                      child: Icon(Icons.edit)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      // other widgets here
                    ],
                  ),
                ),
              )

              // Container(
              //   height: 360,
              //   width: 360,
              //   child: Column(
              //     children: [
              //       Expanded(
              //           child: Column(
              //         children: List.generate(10, (index) {
              //           return Container(
              //             height: 50,
              //             width: 360,
              //             margin: EdgeInsets.all(10),
              //             decoration: BoxDecoration(color: Colors.red),
              //           );
              //         }),
              //       ))
              //           //  ListView.builder(
              //           //     // shrinkWrap: true,
              //           //     itemCount: cubit.state.listproduct!.length,
              //           //     physics: BouncingScrollPhysics(),
              //           //     itemBuilder: (c, i) {
              //           //       var prolist = state.listproduct;
              //           //       return Container(
              //           //         child: Padding(
              //           //           padding:
              //           //               const EdgeInsets.only(left: 20, right: 20),
              //           //           child: Row(
              //           //             mainAxisAlignment:
              //           //                 MainAxisAlignment.spaceBetween,
              //           //             children: [
              //           //               Text("1"),
              //           //               // ListTile(
              //           //               //   leading: Image.network(
              //           //               //     prolist![i].image,
              //           //               //     height: 80,
              //           //               //     width: 80,
              //           //               //   ),
              //           //               // ),
              //           //               Padding(
              //           //                   padding: const EdgeInsets.only(
              //           //                       right: 30, top: 10),
              //           //                   child: Image.network(
              //           //                     prolist![i].image,
              //           //                     height: 80,
              //           //                     width: 80,
              //           //                   )),
              //           //               Padding(
              //           //                 padding: const EdgeInsets.only(right: 30),
              //           //                 child: Text(prolist![i].productName),
              //           //               ),
              //           //               Icon(Icons.edit)
              //           //             ],
              //           //           ),
              //           //         ),
              //           //       );
              //           //     }
              //           //     ),

              //     ],
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
