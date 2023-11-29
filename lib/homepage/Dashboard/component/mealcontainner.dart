import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MealContainner_page extends StatelessWidget {
  const MealContainner_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Color.fromARGB(77, 219, 216, 216).withOpacity(1),
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
                      "Meal To Day",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Total Order : 50",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Price : 150000 kip",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 25.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 5.0,
                      percent: 0.7,
                      center: new Text(
                        "70 %",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.white),
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
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Color.fromARGB(77, 219, 216, 216).withOpacity(1),
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
                      "Last Week",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Total Order : 500",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Price : 500000 kip",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 25.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 5.0,
                      percent: 0.5,
                      center: new Text(
                        "50 %",
                        style: new TextStyle(
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
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Color.fromARGB(77, 219, 216, 216).withOpacity(1),
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
                      "Last Month",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Total Order : 6000",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Price : 300000 kip",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 25.0,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 5.0,
                      percent: 0.7,
                      center: new Text(
                        "70 %",
                        style: new TextStyle(
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
}
