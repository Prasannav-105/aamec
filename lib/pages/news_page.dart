// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NewsPage extends StatefulWidget {
  NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int currentNavButton = 0;
  List tabItems = [
    'General',
    'Important',
    'Circular\'s',
    'Events',
  ];

  Map<String, List<String>> news = {
    'general': [
      'This Is Sample General Message',
      'our Alumni Meet held at 01/10/2024',
    ],
    'important': [
      'This Is Important News',
      'Its Very Important To follow rules of college',
      'This Is Very Very Important'
    ],
    'circular': [
      'This Is Sample Circular',
      'All Students Must Write Co\'s PO\'s',
      'All The Students Must follow Dresscode',
      'Who ever scored below average marks in IAT-1 They Are Asked To come with their parents '
    ],
    'event': [
      'This Is event',
      'new event introduced',
      'This Is Very Very important event'
    ],
  };
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "N E W S",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: HexColor("#FF5B22"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              margin: EdgeInsets.all(10),
              duration: Duration(milliseconds: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(-5, -5),
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(5, 5),
                    blurRadius: 8,
                  ),
                ],
              ),
              padding: EdgeInsets.all(12),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentNavButton = index;
                      });
                    },
                    child: AnimatedContainer(
                        padding: EdgeInsets.all(10),
                        duration: Duration(milliseconds: 120),
                        decoration: currentNavButton == index
                            ? BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.deepOrange,
                                      offset: Offset(-4, 4),
                                      blurRadius: 10)
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor(
                                  "#FC6736",
                                ),
                              )
                            : BoxDecoration(
                                border: Border.all(color: Colors.orange),
                                borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          tabItems[index],
                          style: TextStyle(
                              color: currentNavButton == index
                                  ? Colors.white
                                  : Colors.black),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 18,
                ),
                itemCount: news[getitemIndex(currentNavButton)]!.length,
                itemBuilder: (context, index) => AnimatedContainer(
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: Offset(-4, 4),
                          blurRadius: 10)
                    ],
                  ),
                  duration: Duration(milliseconds: 150),
                  child: ListTile(
                    title: Text(news[getitemIndex(currentNavButton)]![index]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getitemIndex(int index) {
    switch (index) {
      case 0:
        return 'general';
      case 1:
        return 'important';
      case 2:
        return 'circular';
      case 3:
        return 'event';
      default:
        return 'important';
    }
  }
}
