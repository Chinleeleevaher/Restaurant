import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/menu_page/cubit/menu_cubit.dart';
import 'package:myproject/homepage/nabar_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/login/Login_Page.dart';

import '../../repository/authen_sipository.dart';
import '../manage_page.dart';
import '../table_page/cubit/tabletype_cubit.dart';
import '../table_page/table_page.dart';

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

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double chight = MediaQuery.of(context).size.height * 0.30 - 50;
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<MenuCubit>();
        return Scaffold(
            drawer: Nabar(
              onChanged: (value) {
                onchangeLanguage(context,
                    value); // <-- here is get the value of onchangeLanguage and send back to reflesh  or make reflesh in navbar page
              },
            ),
            appBar: AppBar(
              actions: [
                GestureDetector(
                    onTap: () => cubit.getproduct(), // here is to make reflesh
                    child: Icon(Icons.refresh_outlined)),
                SizedBox(
                  width: 20,
                ),
                badges.Badge(
                  badgeAnimation: const BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
                  position: BadgePosition.topEnd(top: -1, end: -1),
                  badgeContent: const Text(
                    '1',
                    style: TextStyle(color: Colors.red),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => cardlist()));
                    },
                  ),
                ),
              ],
              title: Text('BM shop'),
            ),
            body: Builder(builder: (context) {
              if (currentPageIndex == 1) {
                return BlocProvider(
                  create: (context) => TabletypeCubit(
                      authenRepository: context.read<AuthenRepository>(), 
                     tableprovider: context.read<tableProvider>()
                      )
                    ..getTabletypes()
                    ..getTables(), // <--here is becuse in the table page is use cubit therefore i have use blocProvider that i can access the table page
                  child: Table_page(),
                );
              }
              if (currentPageIndex == 2) {
                return const Center(child: Homepage());
              }
              if (currentPageIndex == 3) {
                return const Center(child: Manage_page());
              }
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
                                            Image.asset(
                                                'lib/assets/images/1.png')
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
                                            Image.asset(
                                                'lib/assets/images/3.png')
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
                                            Image.asset(
                                                'lib/assets/images/4.png')
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
                      Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: GridView.count(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: List.generate(
                                  cubit.state.listproduct!.length, (index) {
                                var listproduct = state.listproduct;
                                return Container(
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
                                );
                              }
                            )
                          )
                        ),
                    ],
                  ),
                ],
              );
            }),

            // of bottom Navigator
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: Colors.red,
                labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: NavigationBar(
                    onDestinationSelected: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    selectedIndex: currentPageIndex,
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.home),
                        selectedIcon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        label: 'Home',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.table_bar),
                        selectedIcon: Icon(
                          Icons.table_bar,
                          color: Colors.white,
                        ),
                        label: 'Order',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.book),
                        selectedIcon: Icon(
                          Icons.book,
                          color: Colors.white,
                        ),
                        label: 'Manage',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.location_on),
                        selectedIcon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        label: 'Location',
                      ),
                    ]),
              ),
            ));
      },
    );
  }
//   itemDashboard(
//     String title,
//     Image image,
//   ) =>
//       Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                   offset: const Offset(0, 5),
//                   color: Color.fromARGB(77, 219, 216, 216).withOpacity(1),
//                   // color: Colors.white.withOpacity(1),
//                   // color: Theme.of(context).primaryColor.withOpacity(.1),
//                   spreadRadius: 2,
//                   blurRadius: 5)
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(30),
//               decoration: const BoxDecoration(
//                 // shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: AssetImage('lib/assets/images/2.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               //  child: Image.asset('lib/assets/images/2.png'),
//             ),
//             const SizedBox(height: 8),
//             Text(title, style: Theme.of(context).textTheme.titleMedium)
//           ],
//         ),
//       );
// //-------this fucntion is to make setstate and send value back to the appbar---because in nabar is stateless so we can not use setstate
  onchangeLanguage(BuildContext context, String value) {
    context.setLocale(Locale(value));
    setState(() {});
  }
 }
