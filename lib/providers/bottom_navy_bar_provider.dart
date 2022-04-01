import 'package:flutter/material.dart';

class BottomNavyBarProvider with ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void changePage(int i){
    _currentIndex = i;
    notifyListeners();
  }
}