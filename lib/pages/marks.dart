import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MarksPage extends StatefulWidget {
  MarksPage({super.key});

  @override
  State<MarksPage> createState() => _MarksPageState();
}

class _MarksPageState extends State<MarksPage> {
  int touchedIndexiat1 = -1;
  int touchedIndexiat2 = -1;
  List<bool> _expanded = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Internal Assesments"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 8),
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "this is not a dynamic data*",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Name:Prasanna V",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Register No :820421104045",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    _expanded[panelIndex] = isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return const Center(
                          child: Text(
                        "IAT-1 Result Summary",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ));
                    },
                    body: Container(
                      alignment: Alignment.center,
                      height: 400,
                      width: double.infinity,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                              touchCallback: (event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndexiat1 = -1;
                                return;
                              }
                              touchedIndexiat1 = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          }),
                          centerSpaceRadius: 0,
                          sections: showingSectionsIat1(),
                        ),
                      ),
                    ),
                    isExpanded: _expanded[0],
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return const Center(
                        child: Text("IAT-2 Result Summary",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    },
                    body: Container(
                      alignment: Alignment.center,
                      height: 400,
                      width: double.infinity,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                              touchCallback: (event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndexiat2 = -1;
                                return;
                              }
                              touchedIndexiat2 = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          }),
                          centerSpaceRadius: 0,
                          sections: showingSectionsIat2(),
                        ),
                      ),
                    ),
                    isExpanded: _expanded[1],
                    canTapOnHeader: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSectionsIat1() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndexiat1;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 120.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.deepPurple,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.red,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSectionsIat2() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndexiat2;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 120.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.deepPurple,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.red,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
