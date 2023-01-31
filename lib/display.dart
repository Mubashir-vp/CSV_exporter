// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

class MyCSVDisplayScreen extends StatefulWidget {
  const MyCSVDisplayScreen({super.key, required this.csvFilePath});
  final csvFilePath;
  @override
  State<MyCSVDisplayScreen> createState() => _MyCSVDisplayScreenState();
}

class _MyCSVDisplayScreenState extends State<MyCSVDisplayScreen> {
  Future<List<List<dynamic>>> displayCSVData(String path) async {
    final csvFile = File(path).openRead();
    return await csvFile
        .transform(utf8.decoder)
        .transform(
          const CsvToListConverter(),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV File Data"),
      ),
      body: FutureBuilder(
        future: displayCSVData(widget.csvFilePath),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          print("first print${snapshot.data.toString()}");
          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: snapshot.data!
                        .map(
                          (data) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  data[0].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  data[1].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  data[2].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  data[3].toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
