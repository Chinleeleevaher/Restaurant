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
       
      },
      builder: (context, state) {
        var cubit = context.read<ProductsCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Products"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () => cubit.getproduct(), // here is refresh
                  child: Row(
                    children: [
                      const Icon(Icons.refresh_outlined),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                          onTap: () => navService
                                  .pushNamed(AppRount.addproduct)
                                  .then((value) {
                                // <----here is to get value ("true") from addproduct cubit to here for make refresh
                                if (value == true) {
                                  // <---i use Navigator.pop(context) to link betreen this 2 page so it can understand auto the value
                                  cubit.getproduct();
                                }
                              }),
                          child: const Icon(Icons.add))
                    ],
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
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
                    width: 400,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 251, 249, 249),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.state.listproducttype!
                            .length, //cubit.state.listproductype!.length,
                        itemBuilder: (c, i) {
                          var list = state.listproducttype;
                          Color containercolor0 = Colors.white;
                          Color textcolor0 = Colors.red;
                          if (state.listproducttype![i] == state.typeSelect) {
                            containercolor0 = Colors.red;
                            textcolor0 = Colors.white;
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
                                        offset: const Offset(0, 5),
                                        color: const Color.fromARGB(77, 219, 216, 216)
                                            .withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: containercolor0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    list![i].protypeName.toString(),
                                    // list![i].protypeName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: textcolor0),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              const Row(
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
                    width: 400,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 251, 249, 249),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.state.listunit!
                            .length, //cubit.state.listproductype!.length,
                        itemBuilder: (c, i) {
                          var listunit = state.listunit;
                          Color textcolor = Colors.red;
                          Color containercolor = Colors.white;
                          if (state.listunit![i] == state.typeSelectunit) {
                            containercolor = Colors.red;
                            textcolor = Colors.white;
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
                                        offset: const Offset(0, 5),
                                        color: const Color.fromARGB(77, 219, 216, 216)
                                            .withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: containercolor),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    listunit![i].unitName.toString(),
                                    // list![i].protypeName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: textcolor),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 400,
                height: 50,
                decoration: const BoxDecoration(color: Colors.red),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("ລ/ດ",style: TextStyle(color: Colors.white),),
                    Text("ສີນຄ້າ",style: TextStyle(color: Colors.white),),
                    Text("ປະເພດ/ຫົວໜ່ອຍ",style: TextStyle(color: Colors.white),),
                    Text("ຈັດການ",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 400,
                  width: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: List.generate(
                              cubit.state.listproduct!.length, (i) {
                            var prolist = state.listproduct;
                            return Container(
                              height: 50,
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    child: Text(prolist[i].productName),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Text(prolist[i].price.toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                        onTap: () {
                                          cubit.onTypeSelectproduct(prolist[i]);
                                        },
                                        child: const Icon(Icons.edit)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: GestureDetector(
                                        onTap: () {
                                          cubit.deletepro(
                                              int.parse(prolist[i].productId));
                                        },
                                        child: const Icon(Icons.delete)),
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
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
