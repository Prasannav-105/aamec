// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:hexcolor/hexcolor.dart';

Future<List<Map<String, dynamic>>> readCSV() async {
  String data = await rootBundle.loadString('assets/library_all_books.csv');

  // Use CsvToListConverter with fieldDelimiter and eol parameters
  CsvToListConverter csvToListConverter = const CsvToListConverter(
    fieldDelimiter: ',',
    eol: '\n',
  );

  // print("Csv To List Converter $csvToListConverter");
  List<List<dynamic>> rowsAsListOfValues = csvToListConverter.convert(data);
  // print("rowsAsListOfValues ${rowsAsListOfValues[3]} ");
  // Extract header row
  List<String> header = rowsAsListOfValues[0].map((e) => e.toString()).toList();
  // print(header);
  // Remove header row from data
  rowsAsListOfValues.removeAt(0);

  // Convert the remaining rows to a List of Maps
  List<Map<String, dynamic>> dataAsMapList = rowsAsListOfValues.map((list) {
    Map<String, dynamic> row = {};
    for (int i = 0; i < header.length; i++) {
      row[header[i]] = list[i];
    }

    return row;
  }).toList();

  return dataAsMapList;
}

class CSVDisplay extends StatefulWidget {
  const CSVDisplay({super.key});

  @override
  State<CSVDisplay> createState() => _CSVDisplayState();
}

class _CSVDisplayState extends State<CSVDisplay> {
  int itemcount = 0;
  @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 2), () {
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text(
            "CSE Library ",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: readCSV(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, dynamic>> data =
                  snapshot.data as List<Map<String, dynamic>>;
              return Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("No Of Books Available : ",
                                style: TextStyle(color: Colors.white)),
                            Text(
                              data.length.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Number of Books Borrowed. : ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              20.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4, -4),
                                    blurRadius: 8),
                                BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    offset: const Offset(4, 4),
                                    blurRadius: 8),
                              ]),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 7,
                                          horizontal: 7,
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: HexColor("FFC0D9"),
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    Colors.pink.withOpacity(.4),
                                                offset: const Offset(-4, -4),
                                                blurRadius: 10),
                                            BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(.4),
                                                offset: const Offset(4, 4),
                                                blurRadius: 10),
                                          ],
                                        ),
                                        child: Text(
                                          "Si No: ${data[index]['SI.NO.']?.toString()}",
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                            elevation:
                                                MaterialStatePropertyAll(0),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.black),
                                            foregroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white)),
                                        onPressed: () {},
                                        child: const Text("Request this book"))
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    "Title: ${data[index]['TITLE OF THE BOOK']}",
                                    textAlign: TextAlign.center,
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text(
                                  "Author: ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    "${data[index]['AUTHORS']}",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                                const Text(
                                  "PUBLICATION: ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${data[index]['PUBLICATION'] ?? 'null'}",
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Cost:",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${data[index]['COST'] == '_' || data[index]['COST'] == '-' ? 'nil' : data[index]['COST']}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
