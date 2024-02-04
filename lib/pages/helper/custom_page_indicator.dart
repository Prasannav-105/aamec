
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.bannerDetails,
    required PageController pageController,
    required this.currentPage,
  }) : _pageController = pageController;

  final List bannerDetails;
  final PageController _pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          bannerDetails.length,
          (index) => GestureDetector(
                onTap: () {
                  _pageController.jumpToPage(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.all(5),
                  height: index == currentPage ? 10 : 8,
                  width: index == currentPage ? 12 : 8,
                  decoration: BoxDecoration(
                    color: index == currentPage
                        ? HexColor("#f6feff")
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              )),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          borderRadius: BorderRadius.circular(18)),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/menu.png",
              height: 25,
              width: 25,
              color: Colors.white,
            ),
          ),
          const Text(
            "AAMEC CSE",
            style: TextStyle(color: Colors.white, letterSpacing: 2),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/notification.png",
              height: 25,
              width: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
