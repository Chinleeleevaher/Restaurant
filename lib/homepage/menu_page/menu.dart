import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/menu_page/cubit/menu_cubit.dart';
import 'package:myproject/homepage/menu_page/menuProvider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final storage =
      const FlutterSecureStorage(); // <--here is to make stor the token

  @override
  void initState() {
    // TODO: implement initState
    test();
    super.initState();
  }

  test() async {
    String? token = await storage.read(key: "token");
    print("tokenok $token");
  }

  int selectedIndex = -1; // Track the index of the selected container
  @override
  Widget build(BuildContext context) {
    final double chight = MediaQuery.of(context).size.height * 0.30 - 50;
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<MenuCubit>();
        var provide = context.read<tableprovide>();
        var prov = context.read<tableProvider>();
        return Scaffold(
          appBar: AppBar(
              title: Text("Menu"),
              leading: GestureDetector(
                onTap: () {
                  provide.clearorderlist(); // to make clear the product list
                  prov.clearttID();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  child: Icon(Icons.arrow_back),
                ),
              ),
              actions: [
                Consumer<tableprovide>(
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
                    badgeStyle:
                        const badges.BadgeStyle(badgeColor: Colors.white),
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
                        if (prov.tID != null) {
                          navService.pushNamed(AppRount.OrderListMenus);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'ກາລູນາເລືອກໂຕະ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child:
                                                  provide.geTableMenu!.isEmpty
                                                      ? Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            child: Text(
                                                              "ຂໍອາໄພບໍ່ມີໂຕະຫວ່າງແລ້ວ",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child:
                                                                GridView.count(
                                                              shrinkWrap: true,
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              crossAxisCount: 3,
                                                              crossAxisSpacing:
                                                                  10,
                                                              mainAxisSpacing:
                                                                  10,
                                                              children:
                                                                  List.generate(
                                                                provide
                                                                    .geTableMenu!
                                                                    .length,
                                                                (index) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        selectedIndex =
                                                                            index;
                                                                      });
                                                                      cubit
                                                                          .onTypeOrderID(
                                                                        provide.geTableMenu![
                                                                            index],
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color: selectedIndex == index
                                                                                ? Colors.red.withOpacity(0.5)
                                                                                : Colors.grey.withOpacity(0.5),
                                                                            spreadRadius:
                                                                                2,
                                                                            blurRadius:
                                                                                5,
                                                                            offset:
                                                                                Offset(0, 3),
                                                                          ),
                                                                        ],
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.table_bar,
                                                                            size:
                                                                                50,
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                          SizedBox(
                                                                              height: 10),
                                                                          Text(
                                                                            provide.geTableMenu![index].tableName,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: selectedIndex == index ? Colors.red : Colors.black,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TextButton(
                                                  child: Text('ຍົກເລີກ'),
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context); // Close dialog
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text('ຕົກລົງ'),
                                                  onPressed: () async {
                                                    if (prov.tname == null) {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "ກາລຸນາເລືອໂຕະກ່ອນ",
                                                        gravity:
                                                            ToastGravity.CENTER,
                                                      );
                                                    } else {
                                                      MyProgress()
                                                          .loadingProgress(
                                                        context: context,
                                                        title: 'Updating',
                                                      );
                                                      await Future.delayed(
                                                          const Duration(
                                                              seconds: 1));
                                                      Navigator.pop(
                                                          context); // Close dialog
                                                      navService.pushNamed(
                                                          AppRount
                                                              .OrderListMenus);
                                                      // Perform action on Confirm button press
                                                    }
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
                            },
                          );
                        }
                      },
                    ),
                  );
                }),
              ]),
          body: Builder(builder: (context) {
            return ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10)),
                          color: Theme.of(context).primaryColorLight),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 150,
                                    height: chight,
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(0, 5),
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2),
                                        ],
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20.0))),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Text(
                                            "Favorite",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Image.asset('lib/assets/images/1.png')
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: chight,
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(0, 5),
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2),
                                        ],
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20.0))),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Newest",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Image.asset('lib/assets/images/3.png')
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: chight,
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(0, 5),
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2),
                                        ],
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20.0))),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Text(
                                            "Super",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Image.asset('lib/assets/images/4.png')
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Theme.of(context).primaryColorLight,
                      child: Column(
                        children: [
                          Container(
                            height: 20,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 251, 249, 249),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(200))),
                            // child: Text("data"),
                          ),
                        ],
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
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 1,
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
                                if (state.listproductype![i] ==
                                    state.typeSelect) {
                                  _containercolor = Colors.red;
                                  _textcolor = Colors.white;
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      cubit.onTypeSelect(list[
                                          i]); // <--here is to make ontap and select in productype
                                    },
                                    child: Container(
                                      height: 8,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 5),
                                              color: Color.fromARGB(
                                                      77, 219, 216, 216)
                                                  .withOpacity(1),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: _containercolor),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          list![i].protypeName,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: _textcolor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(
                                cubit.state.listproduct!.length, (index) {
                              var listproduct = state.listproduct;
                              return GestureDetector(
                                onTap: () {
                                  cubit.otypeorder(listproduct[index]);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 8, right: 5, left: 5),
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
                                            borderRadius:
                                                BorderRadius.circular(5.0),
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
                                            text: listproduct[index]
                                                .price
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
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
              ],
            );
          }),
        );
      },
    );
  }
}
