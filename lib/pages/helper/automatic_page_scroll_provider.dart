import 'dart:async';

import 'package:flutter/material.dart';

class AutomaticPageScrollProvider extends ChangeNotifier {
  int _currentPage = 0;
  automaticPageScroll() {
    Timer.periodic(Duration(seconds: 4), (timer) {
      if (_currentPage >= 0) {
        pageIncrement();
      }
      if (_currentPage == 3) {
        pageDecrement();
        notifyListeners();
      }
    });
    notifyListeners();
  }

 

  pageIncrement() {
    notifyListeners();
    return _currentPage++;
  }

  pageDecrement() {
    notifyListeners();
    return _currentPage = 0;
  }

  get currentPage => _currentPage;
}
