// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';

class UserReport extends StatelessWidget {
  const UserReport({Key? key});

  @override
  Widget build(BuildContext context) {
    var provide = context.read<getUserProvider>();
    return SingleChildScrollView(
      child: Column(
        children: List.generate(provide.getUser!.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Card(
              elevation: 3,
              child: InkWell(
                onTap: () {
                  // Handle onTap event if needed
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                               Text(
                              provide.getUser![index].phone.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
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
              ),
            ),
          );
        }),
      ),
    );
  }
}
