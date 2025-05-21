import 'package:flutter/material.dart';

class ChangeCourse extends ChangeNotifier {
  String subject = "";

  void changeSubjects(String newSub) {
    subject = newSub;
    notifyListeners();
  }
}
