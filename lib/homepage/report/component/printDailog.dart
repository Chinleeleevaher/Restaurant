// ignore_for_file: use_build_context_synchronously, deprecated_member_use, file_names

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future printdailog(BuildContext context) {
  //var orderproviders = context.read<orderprovider>();
  var reportProvider = context.read<ReportProvider>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Order',
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
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        "Date: ${DateTime.now()}"), // Replace with actual date logic
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("ລ/ດ"),
                    Text("ເລກບິນ"),
                    Text("ຈໍນນວນ"),
                    Text("ລາຄາ"),
                    Text("ຈ່າຍ"),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: List.generate(
                    reportProvider.orderReport!.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text((index + 1).toString()),
                            Text(reportProvider.orderReport![index].orId
                                .toString()),
                            Text(reportProvider.orderReport![index].orQty
                                .toString()),
                            Text(reportProvider.orderReport![index].orAmount
                                .toString()),
                            Text(reportProvider.orderReport![index].payment,
                                style: const TextStyle(color: Colors.green)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        MyProgress().loadingProgress(
                          context: context,
                          title: 'ກໍາລັງດາວໂຫຼດ',
                        );
                        await exportIncome(
                            context); // Assuming this function generates the PDF
                        Navigator.of(context).pop(); // Close the dialog
                        Fluttertoast.showToast(
                          msg: "ດາວໂຫຼດສໍາເລັດ",
                          gravity: ToastGravity.CENTER,
                        );
                      },
                      child: const Text('Download PDF'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('Print'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> exportIncome(BuildContext context) async {
  var reportProvider = context.read<ReportProvider>();
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
              'ລາຍງານອໍເດີວັນທີ ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
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
                'ເລກບິນ',
                'ຈໍານວນ',
                'ລາຄາ',
                'ຈ່າຍ',
              ],
              data: List<List<String>>.generate(
                reportProvider
                    .orderReport!.length, // Replace with your actual data count
                (i) => [
                  '${i + 1}',
                  reportProvider.orderReport![i].orId
                      .toString(), // Example placeholder; replace with actual data
                  reportProvider.orderReport![i].orQty
                      .toString(), // Example placeholder; replace with actual data
                  reportProvider.orderReport![i].orAmount
                      .toString(), // Example placeholder; replace with actual data
                  reportProvider.orderReport![i]
                      .payment, // Example placeholder; replace with actual data
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
  final file = File('${directory?.path}/Order-report.pdf');

  await file.writeAsBytes(await pdf.save());

}
