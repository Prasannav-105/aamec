// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  WelcomeBanner({
    super.key,
    required this.index,
    required this.bannerDetails,
  });

  final List bannerDetails;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.98),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        height: MediaQuery.of(context).size.height * .25,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            index >= 1
                ? Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bannerDetails[index][0],
                          style: const TextStyle(fontSize: 25),
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
                                                    Colors.white),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.black)),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                        bannerDetails[index][1]
                                                            .length,
                                                        (value) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                bannerDetails[
                                                                        index]
                                                                    [1][value],
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .red),
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
                                style: const TextStyle(color: Colors.red),
                              )
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      bannerDetails[index][0],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25),
                    ),
                  )
          ],
        ));
  }
}