import 'dart:developer';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import '../display.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class CsvServices {
  CsvServices(this.context);
  var context;
  generateCSVFile() async {
    List<List<String>> data = [
      ["Name", "Position", "Club Name", "Country"],
      ["Ronaldo", "CF", "Manchester United", "Portugal"],
      ["Lionel Messi", "RWF", "Paris Saint-Germain", "Argentina"],
      ["Neymar Jr.", "LWF", "Paris Saint-Germain", "Brazil"]
    ];
    String csvData = const ListToCsvConverter().convert(data);

    final path = (await getApplicationDocumentsDirectory()).path;
    String filePath = "$path/csv-1.csv";
    File file = File(filePath);
    await file.writeAsString(
      csvData,
      flush: true,
    );
    // await file.open();

    
     OpenFile.open(
      "$path/csv-1.csv",
    );
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return MyCSVDisplayScreen(csvFilePath: filePath);
    //     },
    //   ),
    // );
  }
}
