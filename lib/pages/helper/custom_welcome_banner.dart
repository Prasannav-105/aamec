// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  WelcomeBanner({
    super.key,
    required this.index,
    required this.bannerDetails,
  });
  final bannerAssets = [
    'assets/banner-bg-3.jpg',
    'assets/banner-bg-1.jpg',
    'assets/banner-bg-3.jpg',
  ];
  final List bannerDetails;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.8),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(
                  -5,
                  -5,
                ),
                blurRadius: 6),
            BoxShadow(
                color: Colors.white24,
                offset: Offset(
                  5,
                  5,
                ),
                blurRadius: 10),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        height: MediaQuery.of(context).size.height * .25,
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image(
                  image: AssetImage(bannerAssets[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.15),
                  borderRadius: BorderRadius.circular(13)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                index >= 1
                    ? Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                bannerDetails[index][0],
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                            index == 2
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            style: const ButtonStyle(
                                                foregroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.black),
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.white)),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Mission Of CSE Department",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        ...List.generate(
                                                            bannerDetails[index]
                                                                    [1]
                                                                .length,
                                                            (value) => Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    bannerDetails[
                                                                            index]
                                                                        [
                                                                        1][value],
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ))
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Text("Click Here")),
                                      )
                                    ],
                                  )
                                : Text(
                                    bannerDetails[index][1],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                          ],
                        ),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment(0, -1),
                          child: Column(
                            children: [
                              Text(
                                bannerDetails[index][0],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              SizedBox(
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ],
        ));
  }
}
