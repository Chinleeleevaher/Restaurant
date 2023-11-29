import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../responsives.dart';

class AddUnit_page extends StatefulWidget {
  const AddUnit_page({super.key});

  @override
  State<AddUnit_page> createState() => _AddUnit_pageState();
}

class _AddUnit_pageState extends State<AddUnit_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Unit"),
        ),
        body: Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: "ຈໍານວນ"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 46,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
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
                        title(),
                        SizedBox(
                          height: 16,
                        ),
                        detail(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context)) SizedBox(width: 16),
                  // On Mobile means if the screen is less than 850 we don't want to show it
                  if (!Responsive.isMobile(context)) textbuttom()
                ],
              ),
            ),
          ],
        ));
  }
}

class title extends StatelessWidget {
  const title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VerticalDivider(),
          Text("ລ/ດ"),
          VerticalDivider(),
          Text("ເລກ ID"),
          VerticalDivider(),
          Text("Name"),
          VerticalDivider(),
          Text("Edit"),
          VerticalDivider(),
          Text("Delete"),
          VerticalDivider(),
        ],
      ),
    );
  }
}

class detail extends StatelessWidget {
  const detail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50, left: 50),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(10, (i) {
                  // var prolist = state.listproduct;
                  return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            // child: Text(prolist![i].productName),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            // child: Text(prolist[i].price.toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                // cubit.onTypeSelectproduct(prolist[i]);
                              },
                              child: Icon(Icons.edit),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                // cubit.deletepro(int.parse(prolist[i].productId));
                              },
                              child: Icon(Icons.delete),
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
    );
  }
}

class textbuttom extends StatelessWidget {
  const textbuttom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(right: 70),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Add Unit"),
            ),
            SizedBox(
              height: 70,
            ),
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
    );
  }
}
