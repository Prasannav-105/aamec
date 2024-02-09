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
  List<Color> _colors = [
    Colors.deepPurple,
    Colors.greenAccent,
    Colors.yellow,
    Colors.red
  ];
  List<String> subjects = [
    'CS3551 Compiler Design',
    'CS3591 Computer Networks',
    'CB3591 Cyber Security',
    'CS3454 Network Security'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.primaries[4].shade400,
          foregroundColor: Colors.white,
          shadowColor: Colors.primaries[4],
          centerTitle: true,
          elevation: 8,
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
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "assets/book-3.jpg",
                          // fit: BoxFit.cover,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   color: Colors.black.withOpacity(.2),
                    // ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  this is not a dynamic data*",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "  Name:Prasanna V",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("  Register No :820421104045",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
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
                        child: Text("IAT-1 Result Summary",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    },
                    body: Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.black.withOpacity(.19),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // color: Colors.black.withOpacity(.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.all(10),
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                    touchCallback: (event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
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
                          ...List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    color: _colors[index],
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(subjects[index])
                                ],
                              ),
                            ),
                          )
                        ],
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
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.black.withOpacity(.19),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // color: Colors.black.withOpacity(.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.all(10),
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                    touchCallback: (event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
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
                          ...List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    color: _colors[index],
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(subjects[index])
                                ],
                              ),
                            ),
                          )
                        ],
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
            color: _colors[0],
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
            color: _colors[1],
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
            color: _colors[2],
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
            color: _colors[3],
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
