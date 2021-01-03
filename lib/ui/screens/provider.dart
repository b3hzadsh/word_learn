import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int counter = 5;
  void inc() {
    counter++;
    notifyListeners();
  }
}
