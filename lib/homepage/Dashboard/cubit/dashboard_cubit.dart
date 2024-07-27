// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/homepage/Dashboard/model/incomeYearModel.dart';
import 'package:myproject/homepage/report/incomeModel/INcomeModel.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final AuthenRepository authenRepository;
  final ReportProvider reportProvider;
  DashboardCubit({
    required this.authenRepository,
    required this.reportProvider,
  }) : super(DashboardState());

 //-----of date time picker of week-------------
  DateTime from_pickdate = DateTime.now().subtract(const Duration(
      days: 7)); // <--here is to set the default date to from 5 days ago
 
  DateTime To_pickdate = DateTime.now();

  //-----of date time picker od year-------------

DateTime toPickYear = DateTime.now();
///=====>>>> no more use <<======
/// ...........of product low quantity...................
  Future<void> lowquantityProduct() async {
     emit(state.coppywith(status: dashBoardstatus.loading));
    var result = await authenRepository.lowquantityProduct();
    result!.fold((l) {
    }, (data) {
     reportProvider.setproduclowquantity(data);
       emit(state.coppywith(
        status: dashBoardstatus.success,
      ));         
    });
  }
///=====>>>> no more used the above fucntion <<======
/// ...........of weekly sale...................
  Future<void> selectWeekIncome() async {
     emit(state.coppywith(status: dashBoardstatus.loading));
    var result = await authenRepository.selectIncome(
        fromdate: from_pickdate, todate: To_pickdate);
    result!.fold((l) {
    }, (data) {
    //  reportProvider.OrderReport(data);
    calculateIncome48Hours(data);
    selectIncomeWeek(data);
    
       emit(state.coppywith(
        status: dashBoardstatus.success,
      ));
         
  
    });
  }
  
  
  // .....here  is calculate the income of day..............
void calculateIncome48Hours(List<IncomeModel> incomeData) {
  DateTime now = DateTime.now();
  DateTime startTime = now.subtract(const Duration(hours: 48));

  // Filter income data for the last 48 hours
  List<IncomeModel> filteredData = incomeData.where((entry) => entry.ordDate.isAfter(startTime)).toList();

  Map<String, Map<String, num>> totalsByPeriod = {};

  for (var entry in filteredData) {
    // Extract year, month, and day from the date
    String periodKey = '${entry.ordDate.year}-${entry.ordDate.month}-${entry.ordDate.day}';

    // Initialize the period key if it doesn't exist
    if (!totalsByPeriod.containsKey(periodKey)) {
      totalsByPeriod[periodKey] = {
        'totalAmount': 0,
        'totalQty': 0,
      };
    }

    // Accumulate amount and qty for the current period
    totalsByPeriod[periodKey]!['totalAmount'] = totalsByPeriod[periodKey]!['totalAmount']! + entry.amount;
    totalsByPeriod[periodKey]!['totalQty'] = totalsByPeriod[periodKey]!['totalQty']! + entry.qty;
  }

  // Accumulate total amount and total qty across all periods
  num totalAmountAllPeriods = 0;
  num totalQtyAllPeriods = 0;

  totalsByPeriod.forEach((period, totals) {
    totalAmountAllPeriods += totals['totalAmount'] ?? 0;
    totalQtyAllPeriods += totals['totalQty'] ?? 0;
  //  print("Period: $period, Total Amount: ${totals['totalAmount'] ?? 0}, Total Qty: ${totals['totalQty'] ?? 0}");
  });
  reportProvider.incomehoursAmount( totalQtyAllPeriods);
    reportProvider.incomehoursQty(totalAmountAllPeriods);
}






  // .....here  is calculate the income of weekly sale..............
  void selectIncomeWeek(List<IncomeModel> incomeData) {
  // Get current year and month
  DateTime now = DateTime.now();
  int currentYear = now.year;
  int currentMonth = now.month;
  Map<String, Map<String, num>> totalsByMonths = {};

  for (var entry in incomeData) {
    // Extract year and month from the date
    int entryYear = entry.ordDate.year;
    int entryMonth = entry.ordDate.month;

    // Check if the entry month is the current month and within the current year
    if (entryYear == currentYear && entryMonth == currentMonth) {
      String monthKey = '$entryYear-${entryMonth.toString().padLeft(2, '0')}';

      // Initialize the month key if it doesn't exist
      if (!totalsByMonths.containsKey(monthKey)) {
        totalsByMonths[monthKey] = {
          'amount': 0,
          'qty': 0,
        };
      }

      // Accumulate amount and qty for the current month
      totalsByMonths[monthKey]!['amount'] = totalsByMonths[monthKey]!['amount']! + entry.amount;
      totalsByMonths[monthKey]!['qty'] = totalsByMonths[monthKey]!['qty']! + entry.qty;
    } else {
      // If entry month is not the current month or not in the current year, break the loop
     
    }
  }

  // Output totals
  totalsByMonths.forEach((month, totals) {
    num totalAmount = totals['amount'] ?? 0;
    num totalQty = totals['qty'] ?? 0;
   /// print("Month: $month, Total Amount: $totalAmount, Total Qty: $totalQty");
    // Assuming reportProvider.incomeMoth accepts two parameters: totalAmount and totalQty
    reportProvider.incomeWeekAmount(totalAmount);
    reportProvider.incomeWeekQty(totalQty);
  });
}
///...........of Year Sale ..............................
  Future<void> selectInccomeMoth() async {
    emit(state.coppywith(status: dashBoardstatus.loading));
    var result = await authenRepository.selectInccomeYear(
        PickYear: toPickYear.year);
    result!.fold((l) {
      emit(state.coppywith(status: dashBoardstatus.error));
    }, (data) {
      //  reportProvider.OrderReport(data);
      calculateAndPrintIncomeMonth(data);
      emit(state.coppywith(
        status: dashBoardstatus.success,
      ));
    });
  }
///........... calculate data of Month ............
void calculateAndPrintIncomeMonth(List<IncomeYearModel> incomeData) {
  // Get current year and month
  DateTime now = DateTime.now();
  int currentYear = now.year;
  int currentMonth = now.month;
  

  Map<String, Map<String, num>> totalsByMonths = {};

  for (var entry in incomeData) {
    // Extract year and month from the date
    int entryYear = entry.ordDate.year;
    int entryMonth = entry.ordDate.month;

    // Check if the entry month is the current month and within the current year
    if (entryYear == currentYear && entryMonth == currentMonth) {
      String monthKey = '$entryYear-${entryMonth.toString().padLeft(2, '0')}';

      // Initialize the month key if it doesn't exist
      if (!totalsByMonths.containsKey(monthKey)) {
        totalsByMonths[monthKey] = {
          'amount': 0,
          'qty': 0,
        };
      }

      // Accumulate amount and qty for the current month
      totalsByMonths[monthKey]!['amount'] = totalsByMonths[monthKey]!['amount']! + entry.amount;
      totalsByMonths[monthKey]!['qty'] = totalsByMonths[monthKey]!['qty']! + entry.qty;
    } else {
      // If entry month is not the current month or not in the current year, break the loop
     
    }
  }

  // Output totals
  totalsByMonths.forEach((month, totals) {
    num totalAmount = totals['amount'] ?? 0;
    num totalQty = totals['qty'] ?? 0;
   // print("Month: $month, Total Amount: $totalAmount, Total Qty: $totalQty");
    // Assuming reportProvider.incomeMoth accepts two parameters: totalAmount and totalQty
    reportProvider.incomeMothAmount(totalAmount);
    reportProvider.incomeMothQty(totalQty);
  });
}



  ///...........of Year Sale ..............................
  Future<void> selectInccomeYear() async {
    emit(state.coppywith(status: dashBoardstatus.loading));
    var result = await authenRepository.selectInccomeYear(
        PickYear: toPickYear.year);
    result!.fold((l) {
      emit(state.coppywith(status: dashBoardstatus.error));
    }, (data) {
      //  reportProvider.OrderReport(data);
      calculateAndPrintIncomeYear(data);
      emit(state.coppywith(
        status: dashBoardstatus.success,
      ));
    });
  }

///........... calculate data of year ............
  //List<num> YearData = [];
  void calculateAndPrintIncomeYear(List<IncomeYearModel> incomeData) {
  Map<String, Map<String, num>> totalsByYear = {};

  for (var entry in incomeData) {
    // Extract year from the date
    String yearKey = entry.ordDate.year.toString();

    // Initialize the year key if it doesn't exist
    if (!totalsByYear.containsKey(yearKey)) {
      totalsByYear[yearKey] = {'amount': 0,'qty': 0,
      };
    }

    // Accumulate amount and qty for the current year
    totalsByYear[yearKey]!['amount'] = totalsByYear[yearKey]!['amount']! + entry.amount;
    totalsByYear[yearKey]!['qty'] =  totalsByYear[yearKey]!['qty']! + entry.qty;
  }

  // Output totals
  totalsByYear.forEach((year, totals) {
    num totalAmount = totals['amount'] ?? 0;
    num totalQty = totals['qty'] ?? 0;
  //  print("Year: $year, Total Amount: $totalAmount, Total Qty: $totalQty");
    // Assuming reportProvider.incomeYear accepts two parameters: totalAmount and totalQty
    reportProvider.incomeYearAmount(totalAmount);
    reportProvider.incomeYearQty(totalQty);
  });
}

}
