import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myproject/component/language_dailog.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/home_page.dart';
import 'package:myproject/homepage/user/getuser/user.dart';
import 'package:myproject/login/Login_Page.dart';
import 'package:myproject/login/cubit/login_cubit.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/model/loginmodel.dart';
import 'package:myproject/signin/cubit/sign_in_cubit.dart';
import 'package:provider/provider.dart';

class Nabar extends StatelessWidget {
  final Function(String)
      onChanged; // <---- this is to send the value to update as setsate in menu page

  Nabar({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final storage =
      const FlutterSecureStorage(); // <--here is to make delete the token when i make logout

  @override
  Widget build(BuildContext context) {
    //this code below is to access or read UserProvider
    var homeState = context.read<UserProvider>(); // <-- here is to access the provider of login provider to show the data of user to her
    //print("user " + homeState.userlist.toString());
    UserLoginModel? user = UserLoginModel(uid: 0, username: '', email: '', password: '', phone: 0, gender: '', address: '', status: '', image: '');
    if(homeState.user !=null){
      user =  homeState.user;
    }
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
          color: Colors.red, // Set the color to red
        ),
              currentAccountPicture:
              // ignore: unnecessary_null_comparison
              user!.image != null ?
              CircleAvatar(
                backgroundColor: Colors.white,
                 backgroundImage: NetworkImage(user!.image),
              ):   Icon(
                  Icons.person,
                  color: Colors.red,
                  size: 60.0,
                ),
              accountName: Text(user.username), // <-- why it is [0] because UserProvider is get the data from the user cubit as model and in side are come as list ite mean can login only one user that why is came only one list
              accountEmail: Text(user.email)
              ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text(LocaleKeys.people.tr()),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(LocaleKeys.favorite.tr()),
          ),
          const Divider(
            height: 10,
            color: (Colors.black),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(LocaleKeys.changeLanguage.tr()),
            onTap: () {
              onSelectLanguages(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(LocaleKeys.setting.tr()),
            // onTap: (){auth.signOut();},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red,),
            title: Text(LocaleKeys.logout.tr(), style: TextStyle(color: Colors.red)),
            onTap: () async {
              await storage.delete(key: 'token'); // <-- here is to make logout
              await storage.delete(key: 'username');
              await storage.delete(key: 'password');
              Navigator.pop(context);
              navService.pushReplacementNamed(AppRount.loginpage);
            },
          ),
        ],
      ),
    );
  }

  //----this fucntion is to make change language----------
  onSelectLanguages(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: AlertLanguage(
          //------- here is mean onLanguageChange to send the value from language_dailoge page  and then onchange send the value to update or make setstate in menu page because in the page is statelesswiget therefor can not use setstate--------//
          onLanguageChange: (value) {
            onChanged(value);
          },
        ),
      ),
    );
  }
}
