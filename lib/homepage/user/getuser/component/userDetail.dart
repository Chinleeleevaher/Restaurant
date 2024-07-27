// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
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
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
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
                                    style: const TextStyle(
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
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
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
                                    style: const TextStyle(
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
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
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
                                    style: const TextStyle(
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
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
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
                                    style: const TextStyle(
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
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
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
                                    style: const TextStyle(
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
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
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
                                    style: const TextStyle(
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
                        child: const Text('Delete',style: TextStyle(color: Colors.red),),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text('ຕ້ອງການລົບແທ້ບໍ່?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('ບໍ່'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      getCubit.deleteUser();
                                      Navigator.of(context).pop();
                                      getCubit.getuser();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('ແມ່ນ'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Edit'),
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
