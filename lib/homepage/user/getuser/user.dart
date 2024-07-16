import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/user/getuser/component/userDetail.dart';
import 'package:myproject/homepage/user/getuser/cubit/get_user_cubit.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCubit, GetUserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var provide = context.read<getUserProvider>();
        var cubits = context.read<GetUserCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text("User"),
          ),
          body: Builder(builder: (context) {
            if (state.status == getuserStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: List.generate(provide.getUser!.length, (index) {
                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        cubits.ontyeSelectUser(provide.getUser![index].uid);
                        UserDetail(context).then((value) {
                          // .......here is make reflesh after i update. i was send true from user_cubit to here
                          if (value = true) {
                            cubits.getuser();
                          }
                        });
                      },
                      child: InkWell(
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.grey[200],
                                      child: provide.getUser != null &&
                                              provide.getUser![index].image !=
                                                  null &&
                                              provide.getUser![index].image!
                                                  .isNotEmpty
                                          ? ClipOval(
                                              child: Image.network(
                                                provide.getUser![index].image!,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : Icon(
                                              Icons.person,
                                              size: 30,
                                              color: Colors.red,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      provide.getUser![index].username,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      provide.getUser![index].email.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      provide.getUser![index].status.toString(),
                                      style: TextStyle(color: Colors.green),
                                    ),
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
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navService.pushNamed(AppRount.adduser).then((value) {
                if (value = true) {
                  //...........here is to make reflesh in get user afetr i add user. i was send true from the user_cubit
                  cubits.getuser();
                }
              });
              ;
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}
