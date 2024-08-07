// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: camel_case_types
class incomContainner_page extends StatelessWidget {
  const incomContainner_page({super.key});

  @override
  Widget build(BuildContext context) {
    var provide = context.read<ReportProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: const Color.fromARGB(77, 219, 216, 216).withOpacity(1),
                    spreadRadius: 2,
                    blurRadius: 5),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "weekly sales",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Total Order : ${provide.weekQty}",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Price : ${provide.weekAmount}kip",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 25.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 5.0,
                      percent:  0.7, // Ensure percent is between 0.0 and 1.0
                      center: const Text(
                        '70 %', // Display percentage with one decimal place
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                      progressColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: const Color.fromARGB(77, 219, 216, 216).withOpacity(1),
                    spreadRadius: 2,
                    blurRadius: 5),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Month",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Total Order :${provide.monthQty}",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Price :${provide.monthAmount}Kip",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 25.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 5.0,
                      percent: 0.5,
                      center: const Text(
                        "50 %",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.black),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                      progressColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: const Color.fromARGB(77, 219, 216, 216).withOpacity(1),
                    spreadRadius: 2,
                    blurRadius: 5),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Year",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Total Order : ${provide.yearqty}",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Price : ${provide.yearAmount}",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 25.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 5.0,
                      percent: 0.7,
                      center: const Text(
                        "70 %",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.black),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                      progressColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
