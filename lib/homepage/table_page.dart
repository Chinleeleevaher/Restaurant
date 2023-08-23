import 'package:flutter/material.dart';
import 'package:myproject/homepage/nabar_page.dart';

class Table_page extends StatefulWidget {
  const Table_page({super.key});

  @override
  State<Table_page> createState() => _Table_pageState();
}

class _Table_pageState extends State<Table_page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage '),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ປະເພດໂຕະ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 168, 164, 164)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "ທັງໝົດ",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 168, 164, 164)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "VIP",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 168, 164, 164)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "ທໍາມະດາ",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "ໂຕະທັງໝົດ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(color: Colors.white),
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  shrinkWrap: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    itemDashboard('ໂຕະ 1', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 2', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 3', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 4', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 5', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 6', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 7', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 8', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 9', Icon(Icons.table_bar)),
                    itemDashboard('ໂຕະ 10', Icon(Icons.table_bar)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemDashboard(
    String title,
    Icon IconData,
  ) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Color.fromARGB(77, 219, 216, 216).withOpacity(1),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Icon(
                    IconData.icon,
                    color: Colors.green,
                  ),
                  Text(title, style: Theme.of(context).textTheme.titleMedium)
                ],
              ),
            ),
          ],
        ),
      );
}
