// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
   // var provide = context.read<ReportProvider>();
    return Consumer<ReportProvider>(builder: (context, provide, widget) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.5, // adjust the fraction as needed
          width: MediaQuery.of(context).size.width *
              0.1, // adjust the fraction as needed
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.01,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   Text(LocaleKeys.order.tr()),//..of order text
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.diamond,
                                            color: Colors.blue,
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(left: 10)),
                                          Text(provide.hoursAmount.toString()),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.1,
                                  width: MediaQuery.of(context).size.width * 0.01,
                                  color: Colors.pink,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(LocaleKeys.totalPrice.tr()),///..of to total price
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.food_bank_outlined,
                                              color: Colors.pink,
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.only(left: 10)),
                                            Text("${provide.hoursQty} kip"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.3, // adjust the fraction as needed
                    width: MediaQuery.of(context).size.width *
                        0.5, // adjust the fraction as needed
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                      ),
                    ),
                    child: CircularPercentIndicator(
                      radius: 70.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 15.0,
                      percent: 0.7,
                      center: Text(
                         "40 ${LocaleKeys.hours.tr()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.black12,
                      progressColor: Colors.green,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                       Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                         provide.produclowquantity[0].productName.toString(),
                          style:
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 100, //MediaQuery.of(context).size.width - 280,
                        animation: true,
                        lineHeight: MediaQuery.of(context).size.height * 0.02,
                        animationDuration: 2000,
                        percent: 0.7,
                        center: const Text(
                          "70.0%",
                          style: TextStyle(fontSize: 12),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.greenAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text("${provide.produclowquantity[0].quantity.toString()} ${LocaleKeys.bottleleft.tr()}"),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          provide.produclowquantity[1].productName.toString(),
                          style:
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 100, //MediaQuery.of(context).size.width - 280,
                        animation: true,
                        lineHeight: MediaQuery.of(context).size.height * 0.02,
                        animationDuration: 2000,
                        percent: 0.9,
                        center: const Text(
                          "90.0%",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.pink,
                      ),
                     Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text("${provide.produclowquantity[1].quantity.toString()} ${LocaleKeys.bottleleft.tr()}"),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          provide.produclowquantity[2].productName.toString(),
                          style:
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 100,//MediaQuery.of(context).size.width - 280,
                        animation: true,
                        lineHeight: MediaQuery.of(context).size.height * 0.02,
                        animationDuration: 2000,
                        percent: 0.5,
                        center: const Text(
                          "50.0%",
                          style: TextStyle(fontSize: 12),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.amber,
                      ),
                     Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text("${provide.produclowquantity[2].quantity.toString()}  ${LocaleKeys.bottleleft.tr()}"),
                      ),
                    ],
                  ),
                ],
              ) 
            ],
          ),
        );
      }
    );
  }
}
