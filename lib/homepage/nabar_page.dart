import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:provider/provider.dart';

class Nabar extends StatelessWidget {
  Nabar({Key? key}) : super(key: key);

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    //this code below is to access or read UserProvider
    var homeState = context.read<UserProvider>();
    //print("user " + homeState.userlist.toString());
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.red,
                  size: 60.0,
                ),
                // backgroundImage: AssetImage("lib/assets/image/people.png"),
              ),
              accountName: Text(homeState.userlist[0].username),
              accountEmail: Text(homeState.userlist[0].email)),
          const ListTile(
            leading: Icon(Icons.people),
            title: Text('People'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('favorite'),
          ),
          const Divider(
            height: 10,
            color: (Colors.black),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            // onTap: (){auth.signOut();},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
