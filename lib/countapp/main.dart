import 'package:flutter/material.dart';
import 'package:my_first_app/countapp/second_page.dart';
import 'package:provider/provider.dart';

import '../courseapp/coursepage.dart';
import 'data_class.dart';
import 'home_page.dart';


void main() {
  runApp(const WhatsAppUI());
}

class WhatsAppUI extends StatelessWidget {
  const WhatsAppUI({super.key});
  @override
  Widget build(BuildContext context) {

    return  ChangeNotifierProvider(
      create: (context)=>DataClass(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: courseapp(),
      ),
    );
  }
}
