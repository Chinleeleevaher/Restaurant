// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myproject/generated/locale_keys.g.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MealContainner_page extends StatelessWidget {
  const MealContainner_page({super.key});

  @override
  Widget build(BuildContext context) {
    //var provide = context.read<ReportProvider>();
    return Consumer<ReportProvider>(builder: (context, provide, widget) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Colors.pink,
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          LocaleKeys.weeklysales.tr(),//...week sale
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "${LocaleKeys.totaleOrder.tr()}: ${ provide.weekQty.toString()}",// qty week sale
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                         "${LocaleKeys.price.tr()}: ${provide.weekAmount} kip",//..price of month
                          style: const TextStyle(color: Colors.white, fontSize: 12),
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
                              color: Colors.white,
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.white,
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
                  color: Colors.blue,
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          LocaleKeys.month.tr(),//..month
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          LocaleKeys.totaleOrder.tr()+ provide.monthQty.toString(),//..month quty
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "${LocaleKeys.price.tr()}: ${provide.monthAmount}Kip",//...of total price
                          style: const TextStyle(color: Colors.white, fontSize: 12),
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
                                color: Colors.white),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.white,
                          progressColor: Colors.red,
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
                  color: Colors.green,
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
                       Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          LocaleKeys.year.tr(),//...of year
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "${LocaleKeys.totaleOrder.tr()} : ${provide.yearqty}",// total order
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "${LocaleKeys.price.tr()} : ${provide.yearAmount}",// total price
                          style: const TextStyle(color: Colors.white, fontSize: 12),
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
                                color: Colors.white),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.white,
                          progressColor: Colors.yellow,
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
    );
  }
}
