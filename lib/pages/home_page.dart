// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:aamec/pages/attendance_page.dart';
import 'package:aamec/pages/chat_page.dart';
import 'package:aamec/pages/events.dart';
import 'package:aamec/pages/library_books.dart';
import 'package:aamec/pages/marks.dart';
import 'package:aamec/pages/materials_page.dart';
import 'package:aamec/pages/news_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'helper/custom_page_indicator.dart';
import 'helper/custom_welcome_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _pageController;

  List bannerDetails = [
    [
      "WELCOME TO C S E",
    ],
    [
      "Vision",
      "To become a centre of excellence in the field of computer science and engineering through high quality education and produce intellectual computer engineers for industry and research.",
    ],
    [
      "Mission of our department",
      [
        "M1: To provide fundamental knowledge in science, mathematics, management and environmental subjects.",
        "M2: To impart in-depth knowledge in core computer science and engineering theory and laboratory courses.",
        "M3: To train students to enhance their problem-solving and programming skills.",
        "M4: To expose students to emerging technologies and tools in the field of computing.",
      ]
    ]
  ];
  List buttonData = [
    ['Attendance', 'assets/attendance.png'],
    ['events', 'assets/events.png'],
    ['library', 'assets/library_book.png'],
    ['marks', 'assets/marks.png'],
    ['materials', 'assets/syllabus.png'],
    ['News', 'assets/newspaper.png'],
  ];

  List<Widget> pages = [
    AttenddancePage(),
    const EventsPage(),
    const CSVDisplay(),
    MarksPage(),
    CustomMaterialPage(),
    NewsPage()
  ];

  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: .95);
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentPage >= 0) {
        currentPage++;
        _pageController.jumpToPage(currentPage);
      }
      if (currentPage == 3) {
        Future.delayed(const Duration(milliseconds: 2), () {
          _pageController.jumpToPage(0);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List routes = [
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => CSVDisplay(),
    //   ))
    // ];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //     transform: GradientRotation(cos(pi) * sin(pi / 3)),
                    // colors: [
                    //   // HexColor("##2C69D1"),
                    //   // HexColor("#0ABCF9"),
                    // ],
                    // begin: Alignment.topLeft,
                    // end: Alignment.bottomRight),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                height: MediaQuery.of(context).size.height * .40,
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .40,
                      child: Column(
                        children: [
                          const CustomAppBar(),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .25,
                            child: PageView.builder(
                              controller: _pageController,
                              onPageChanged: (value) {
                                setState(() {
                                  currentPage = value;
                                });
                              },
                              itemCount: bannerDetails.length,
                              itemBuilder: (context, index) => WelcomeBanner(
                                  bannerDetails: bannerDetails, index: index),
                            ),
                          ),
                          Expanded(
                            child: CustomPageIndicator(
                              bannerDetails: bannerDetails,
                              pageController: _pageController,
                              currentPage: currentPage,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: double.infinity,
              ),
              Align(
                alignment: Alignment(-.8, 0),
                child: Text.rich(
                  TextSpan(
                    text: "Welcome",
                    style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 22,
                    ),
                    children: [
                      TextSpan(
                        text: " Prasanna v",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 2,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: double.infinity,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemCount: buttonData.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.deepPurple.withOpacity(.4),
                                    offset: const Offset(-4, -4),
                                    blurRadius: 8),
                                BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    offset: const Offset(4, 4),
                                    blurRadius: 8),
                              ]),
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => pages[index]));
                            },
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(buttonData[index][1])),
                          ),
                        ),
                        Text(buttonData[index][0])
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
