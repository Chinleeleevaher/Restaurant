import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/nabar_page.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';

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
    return BlocConsumer<TabletypeCubit, TabletypeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<TabletypeCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text('Manage '),
          ),
          body: Container(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ປະເພດໂຕະ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
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
                          itemCount: cubit.state.listtabletype!.length,
                          itemBuilder: (c, i) {
                            var list = state.listtabletype;
                            Color _textcolor = Colors.red;
                            Color _containercolor = Colors.white;
                            if (state.listtabletype![i] == state.typeSelect) {
                              _containercolor = Colors.red;
                              _textcolor = Colors.white;
                            }
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  cubit.onTypeSelect(list[i]);
                                  // cubit.onTypeSelect(list[
                                  //     i]); // <--here is to make ontap and select in productype
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 5),
                                          color:
                                              Color.fromARGB(77, 219, 216, 216)
                                                  .withOpacity(1),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: _containercolor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Text(
                                      list![i].tabletypeName,
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
                        children: List.generate(cubit.state.listtable!.length,
                            (index) {
                          var listtable = state.listtable;
                          return itemDashboard(
                              listtable![index].tableName.toString(),
                              listtable![index].tableSize.toString(),
                              Icon(Icons.table_bar));
                        })
                        // List.generate(
                        //     cubit.state.listtabletype!.length, (index) {
                        //   var listproduct = state.listtabletype;
                        //   return itemDashboard(
                        //       listproduct![index].tabletypeName,
                        //       Icon(Icons.table_bar));

                        // })
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  itemDashboard(
    String title,
    String size,
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
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  Text("size: $size",
                      style: Theme.of(context).textTheme.titleMedium)
                ],
              ),
            ),
          ],
        ),
      );
}
