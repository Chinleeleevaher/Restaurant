import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

late final String title;
Future UserPrint(BuildContext context) {
  //var orderproviders = context.read<orderprovider>();
  var reportProvider = context.read<ReportProvider>();
  var provide = context.read<getUserProvider>();
return showDialog(
  context: context,
  builder: (BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'User',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.restaurant,
                      color: Colors.red,
                      size: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Naban Restaurant"),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Date: " + DateTime.now().toString()),
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("ຊື້/ນໍາສະກຸນ", style: TextStyle(fontFamily: 'lib/assets/fonts/saysettha_ot.ttf'),),
                    Text("ເພດ"),
                    Text("ຕໍາແໜ່ງ"),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: List.generate(provide.getUser!.length, (index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
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
                                      provide.getUser![index].address.toString(),
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
                              Text(
                                provide.getUser![index].gender.toString(),
                              ),
                              Text(
                                provide.getUser![index].status.toString(),
                                style: const TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: const Text('Download PDF'),
                      onPressed: () async {
                        MyProgress().loadingProgress(
                          context: context,
                          title: 'ກໍາລັງດາວໂຫຼດ',
                        );
                        await exportIncome(context);
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                          msg: "ດາວໂຫຼດສໍາເລັດ",
                          gravity: ToastGravity.CENTER,
                        );
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Print'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);

}

Future<void> exportIncome(BuildContext context) async {
  var provide = context.read<getUserProvider>();
  // Load custom font
  final Uint8List fontData =
      (await rootBundle.load('lib/assets/fonts/saysettha_ot.ttf'))
          .buffer
          .asUint8List();
  final pw.Font customFont = pw.Font.ttf(fontData.buffer.asByteData());

  // Initialize PDF document
  final pdf = pw.Document(
    theme: pw.ThemeData.withFont(base: customFont),
  );

  // Add a page to the PDF document
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Title and Date
            pw.Text(
              'ລາຍງານລາຍພະນັກງານ ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
              style: const pw.TextStyle(fontSize: 18),
            ),
            pw.SizedBox(height: 20),
            // Table with data
            pw.Table.fromTextArray(
              border: pw.TableBorder.all(),
              headerAlignment: pw.Alignment.center,
              cellAlignments: {
                0: pw.Alignment.center,
                1: pw.Alignment.center,
                2: pw.Alignment.center,
                3: pw.Alignment.center,
              },
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              headerHeight: 25,
              cellHeight: 30,
              columnWidths: {
                0: const pw.FlexColumnWidth(1),
                1: const pw.FlexColumnWidth(2),
                2: const pw.FlexColumnWidth(3),
                3: const pw.FlexColumnWidth(2),
              },
              headers: [
                'ລຳດັບ',
                'ຊື່/ນໍາສະກຸນ',
                'ເພດ',
                'ຕິດຕໍ່',
                'ຕໍາແໜ່ງ',
              ],
              data: List<List<String>>.generate(
                provide.getUser!.length, // Replace with your actual data count
                (i) => [
                  '${i + 1}',
                  provide.getUser![i].username
                      .toString(), // Example placeholder; replace with actual data
                  provide.getUser![i].gender
                      .toString(), // Example placeholder; replace with actual data
                  provide.getUser![i].phone
                      .toString(), // Example placeholder; replace with actual data
                  provide.getUser![i].status
                      .toString(), // Example placeholder; replace with actual data
                  // DateFormat('yyyy-MM-dd').format(DateTime.now()), // Example placeholder; replace with actual data
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  // Save PDF to device storage
  final directory = await getDownloadsDirectory();
  final file = File('${directory?.path}/User-report.pdf');

  await file.writeAsBytes(await pdf.save());
  print("PDF file created at: ${file.path}");
}









// Future<void> exportIncome() async {
//   final pdf = pw.Document();

//   // ... Add PDF content

//   // Request storage permission if not granted already (for Android 6.0+)
//   if (Platform.isAndroid) {
//     final status = await Permission.storage.request();
//     if (!status.isGranted) {
//       // Handle permission denied scenario
//       print('Permission denied');
//       return; // Exit the function or handle the error appropriately
//     }
//   }

//   // Continue with saving PDF file
//   final directory = await getDownloadsDirectory();
//   if (directory == null) {
//     print('Unable to access downloads directory');
//     return; // Handle error
//   }

//   final file = File('${directory.path}/income-report.pdf');
//   await file.writeAsBytes(await pdf.save());

//   print("PDF file created at: ${file.path}");
// }



