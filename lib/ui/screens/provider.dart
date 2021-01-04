import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  bool _counter = false;
  void setCounter() {
    _counter = true;
    notifyListeners();
  }

  void resetCounter() {
    _counter = false;
    notifyListeners();
  }

  get counter => _counter;
}
