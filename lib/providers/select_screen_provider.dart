import 'package:flutter/widgets.dart';

class SelectScreenProvider extends ChangeNotifier {
  int _selectedScreen = 0;

  int get selectedScreen => _selectedScreen;

  void change(int i) {
    _selectedScreen = i;
    notifyListeners();
  }
}
