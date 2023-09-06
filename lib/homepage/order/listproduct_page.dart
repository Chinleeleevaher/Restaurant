import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/order/cubit/lisproduct_cubit.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_list/orderlist_page.dart';
import 'package:provider/provider.dart';

class ListProduct_page extends StatefulWidget {
  const ListProduct_page({super.key});

  @override
  State<ListProduct_page> createState() => _ListProduct_pageState();
}

class _ListProduct_pageState extends State<ListProduct_page> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LisproductCubit, LisproductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        //  var provides = context.read<orderprovider>();
        var cubit = context.read<LisproductCubit>();
        var orderlistprovider = context.read<orderprovider>();
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                orderlistprovider.clearorderlist();// to make clear the product list
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(Icons.arrow_back),
              ),
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    cubit.getproduct();
                  }, // here is to make reflesh
                  child: Icon(Icons.refresh_outlined)),
              SizedBox(
                width: 20,
              ),
              Consumer<orderprovider>(
                  // // <----here is to make change the number in bage when i add order
                  builder: (context, orderstate, child) {
                return badges.Badge(
                  badgeAnimation: const BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
                  position: BadgePosition.topEnd(top: -1, end: -1),
                  badgeContent: Text(
                    orderstate.getbageqty.toString(),
                    // cubit.state.coppywith(orderproduct_c:),
                    style: TextStyle(color: Colors.red),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      navService.pushNamed(AppRount.orderlist);
                    },
                  ),
                );
              }),
            ],
            title: Text('BM shop'),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "ປະເພດອາຫານ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 251, 249, 249),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: cubit.state.listproductype!.length,
                        itemBuilder: (c, i) {
                          var list = state.listproductype;
                          Color _textcolor = Colors.red;
                          Color _containercolor = Colors.white;
                          if (state.listproductype![i] == state.typeSelect) {
                            _containercolor = Colors.red;
                            _textcolor = Colors.white;
                          }
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                cubit.onTypeSelect(list![
                                    i]); // <--here is to make ontap and select in productype
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
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    list![i].protypeName,
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
              Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(cubit.state.listproduct!.length,
                          (index) {
                        var listproduct = state.listproduct;
                        return GestureDetector(
                          onTap: () {
                            cubit.otypeorder(listproduct[index]);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(bottom: 8, right: 5, left: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  color: Color.fromARGB(77, 219, 216, 216)
                                      .withOpacity(1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                          listproduct![index].image),
                                    ),
                                  ),
                                  Text(
                                    listproduct[index].productName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // Text(
                                  //   listproduct[index].price.toString() +
                                  //       "❤",
                                  //   style: TextStyle(color: Colors.red),
                                  // ),
                                  RichText(
                                    text: TextSpan(
                                      text: listproduct[index].price.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: ' Kip',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }))),
            ],
          ),
        );
      },
    );
  }
}
