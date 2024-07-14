// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myproject/homepage/menu_page/cubit/menu_cubit.dart';
// import 'package:myproject/homepage/menu_page/menuProvider.dart';

// Future<void> Tabledailog(BuildContext context) async {
//     var provide = context.read<tableprovide>();
//     // var cubit = context.read<MenuCubit>();
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         contentPadding: EdgeInsets.zero,
//         content: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.7,
//           width: MediaQuery.of(context).size.width * 0.8,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Text(
//                   'ກາລູນາເລືອກໂຕະ',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Container(
//                       padding: EdgeInsets.all(10.0),
//                       child: GridView.count(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         children: List.generate(provide.geTableMenu!.length, (index) {
                       
//                           return GestureDetector(
//                             onTap: () {
                            
//                               Navigator.pop(context); // Close dialog and return table number
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ],
//                                 color: Colors.white,
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.table_bar, size: 50, color: Colors.green),
//                                   SizedBox(height: 10),
//                                   Text(
//                                     provide.geTableMenu![index].tableName, // Display table number starting from 1
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     TextButton(
//                       child: Text('ຍົກເລີກ'),
//                       onPressed: () {
//                         // Perform action on Cancel button press
//                         Navigator.pop(context); // Close dialog
//                       },
//                     ),
//                     TextButton(
//                       child: Text('ຕົກລົງ'),
//                       onPressed: () {
//                         // Perform action on Confirm button press
//                         Navigator.pop(context); // Close dialog
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
