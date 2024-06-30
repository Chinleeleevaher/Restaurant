import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';



class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  List<String> statuses = ['edit', 'delete'];
  List<String> selectedStatuses = List.generate(28, (index) => '...');

  void handleMenuItemSelection(String value, int index) {
    setState(() {
      selectedStatuses[index] = "....";
    });

    if (value == 'delete') {
      // Call your delete function here
      deleteFunction(index);
    } else if (value == 'edit') {
      // Call your edit function here
      editFunction(index);
    }
  }

  void deleteFunction(int index) {
    // Your delete logic here
    print('Delete action for item $index');
  }

  void editFunction(int index) {
    // Your edit logic here
    print('Edit action for item $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(28, (index) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  // cubit.getorderdetail(orderlist);
                },
                child: InkWell(
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.red,
                            size: 30.0,
                          ),
                        ), 
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Expanded(
                              child: Text(
                                "name",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                              Expanded(
                              child: Text(
                                "jinleeleevaher@gmail.com",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                       
                           Padding(
                             padding: const EdgeInsets.all(20),
                             child: Text(
                                  "admin",
                               
                                ),
                           ),
                          
                        
                            PopupMenuButton<String>(
                              child: Text(selectedStatuses[index]),
                              onSelected: (String value) {
                                handleMenuItemSelection(value, index);
                              },
                              itemBuilder: (BuildContext context) {
                                return statuses.map<PopupMenuEntry<String>>((String value) {
                                  return PopupMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
       navService.pushNamed(AppRount.adduser);;
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
