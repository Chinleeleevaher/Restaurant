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
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<ProductsCubit>();

        return Scaffold(
          appBar: AppBar(
            title: const Text("Products"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => cubit.getproduct(),
                      child: const Icon(Icons.refresh_outlined),
                    ),
                    const SizedBox(width: 30),
                    GestureDetector(
                      onTap: () => navService
                          .pushNamed(AppRount.addproduct)
                          .then((value) {
                            if (value == true) {
                              cubit.getproduct();
                            }
                          }),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "ປະເພດສີນຄ້າ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 60,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.state.listproducttype?.length ?? 0,
                      itemBuilder: (context, i) {
                        var list = state.listproducttype;
                        Color containerColor = state.listproducttype?[i] == state.typeSelect ? Colors.red : Colors.white;
                        Color textColor = state.listproducttype?[i] == state.typeSelect ? Colors.white : Colors.red;
                        
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () => cubit.onTypeSelectprotype(list?[i]),
                            child: Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 5),
                                    color: const Color.fromARGB(77, 219, 216, 216).withOpacity(1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: containerColor,
                              ),
                              child: Center(
                                child: Text(
                                  list?[i].protypeName ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: textColor),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "ຫົວໜ່ວຍ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 60,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.state.listunit?.length ?? 0,
                      itemBuilder: (context, i) {
                        var listunit = state.listunit;
                        Color containerColor = state.listunit?[i] == state.typeSelectunit ? Colors.red : Colors.white;
                        Color textColor = state.listunit?[i] == state.typeSelectunit ? Colors.white : Colors.red;
                        
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () => cubit.onTypeSelectunit(listunit?[i]),
                            child: Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 5),
                                    color: const Color.fromARGB(77, 219, 216, 216).withOpacity(1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: containerColor,
                              ),
                              child: Center(
                                child: Text(
                                  listunit?[i].unitName ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: textColor),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.red,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("ລ/ດ", style: TextStyle(color: Colors.white)),
                    Text("ສີນຄ້າ", style: TextStyle(color: Colors.white)),
                    Text("ປະເພດ/ຫົວໜ່ອຍ", style: TextStyle(color: Colors.white)),
                    Text("ຈັດການ", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        cubit.state.listproduct?.length ?? 0,
                        (i) {
                          var prolist = state.listproduct;
                          return Container(
                            height: 50,
                            margin: const EdgeInsets.only(top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(prolist?[i].image ?? ''),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(prolist?[i].productName ?? ''),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(prolist?[i].price.toString() ?? ''),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cubit.onTypeSelectproduct(prolist?[i]);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cubit.deletepro(int.parse(prolist?[i].productId ?? '0'));
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
