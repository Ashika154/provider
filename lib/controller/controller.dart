import 'package:flutter/foundation.dart';
class MyProviderController extends ChangeNotifier{
  int x=0;
  int get value=>x;
  void incrementX(){

    x++;
    if(kDebugMode){
      print("current value of x is $value");
    }
    notifyListeners();
  }
}