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
      
      },
      builder: (context, state) {
        var provide = context.read<getUserProvider>();
        var cubits = context.read<GetUserCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("User"),
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
                  var user = provide.getUser![index];

                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        cubits.ontyeSelectUser(user.uid);
                        UserDetail(context).then((value) {
                          if (value == true) {
                            cubits.getuser();
                          }
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            child: ClipOval(
                              child: provide.getUser != null &&
                                      provide.getUser![index].image != null &&
                                      provide.getUser![index].image!.isNotEmpty
                                  ? Image.network(
                                      provide.getUser![index].image!,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.red,
                                    ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provide.getUser![index].username,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  provide.getUser![index].email.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Tel: ${provide.getUser![index].phone}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                provide.getUser![index].status.toString(),
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                if (value == true) {
                  cubits.getuser();
                }
              });
            },
            child: const Icon(Icons.add, color: Colors.white,),
            backgroundColor: Colors.green,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}
