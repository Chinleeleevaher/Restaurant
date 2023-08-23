import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/nabar_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myproject/login/Login_Page.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final storage = const FlutterSecureStorage();

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
    return Scaffold(
        drawer: Nabar(),
        appBar: AppBar(
          actions: [
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
            return Homepage();
          }
          if (currentPageIndex == 2) {
            return const Center(child: Homepage());
          }
          if (currentPageIndex == 3) {
            return const Login_page();
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 168, 164, 164)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "ອາຫານ",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 168, 164, 164)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "ເຄື່ອງດື້ມ",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 500,
                      width: 350,
                      decoration: BoxDecoration(color: Colors.white),
                      child: GridView.count(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 4,
                        shrinkWrap: false,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: [
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                          itemDashboard('ແກ່ງ', Image.asset('')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),

        // of bottom Navigator
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blueAccent,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                    icon: Icon(Icons.book),
                    selectedIcon: Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    label: 'Manage',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.event_note),
                    selectedIcon: Icon(
                      Icons.event_note,
                      color: Colors.white,
                    ),
                    label: 'Calendar',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings),
                    selectedIcon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    label: 'Setting',
                  ),
                ]),
          ),
        ));
  }

  itemDashboard(
    String title,
    Image image,
  ) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  //color: Colors.white30.withOpacity(1),
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                // shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              //  child: Image.asset('lib/assets/images/2.png'),
            ),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
}
