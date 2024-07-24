import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/user/addUser/cubit/user_cubit.dart';
import 'package:myproject/homepage/user/getuser/cubit/get_user_cubit.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';

Future UserDetail(BuildContext context) {
  //var orderproviders = context.read<orderprovider>();
  var provide = context.read<getUserProvider>();
  var getCubit = context.read<GetUserCubit>();
  //var addCubit = context.read<UserCubit>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius:
                          50, // Increase the radius to make the avatar bigger
                      child: ClipOval(
                        child: Image.network(
                          provide.getUserDetail!.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Name :       ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontSize:
                                            14 // Set the font family for "Name :"
                                        ),
                                  ),
                                  TextSpan(
                                    text: provide.getUserDetail!.username
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors
                                          .blue, // Set the color for the name value
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Gender :       ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            14 // Set the color for "Gender :"
                                        ),
                                  ),
                                  TextSpan(
                                    text: provide.getUserDetail!.gender
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors
                                          .blue, // Set the color for the gender value
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Email :        ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Lato',
                                        fontSize:
                                            14 // Set the font family for "Email :"
                                        ),
                                  ),
                                  TextSpan(
                                    text:
                                        provide.getUserDetail!.email.toString(),
                                    style: TextStyle(
                                      color: Colors
                                          .blue, // Set the color for the email value
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Phone :        ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            14 // Set the color for "Phone :"
                                        ),
                                  ),
                                  TextSpan(
                                    text:
                                        provide.getUserDetail!.phone.toString(),
                                    style: TextStyle(
                                      color: Colors
                                          .blue, // Set the color for the phone number
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Address :     ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize:
                                            14 // Set the font family for "Address :"
                                        ),
                                  ),
                                  TextSpan(
                                    text: provide.getUserDetail!.address
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors
                                          .blue, // Set the color for the address value
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Status :        ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'OpenSans',
                                        fontSize:
                                            14 // Set the font family for "Status :"
                                        ),
                                  ),
                                  TextSpan(
                                    text: provide.getUserDetail!.status
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors
                                          .green, // Set the color for the status value
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: Text('Delete',style: TextStyle(color: Colors.red),),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirmation'),
                                content: Text('ຕ້ອງການລົບແທ້ບໍ່?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('ບໍ່'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      getCubit.deleteUser();
                                      Navigator.of(context).pop();
                                      getCubit.getuser();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('ແມ່ນ'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      ElevatedButton(
                        child: Text('Edit'),
                        onPressed: () {
                          navService.pushNamed(AppRount.updateUser);
                         
                         // Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    },
  );
}
