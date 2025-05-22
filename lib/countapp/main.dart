import 'package:flutter/material.dart';
import 'package:my_first_app/courseapp/changecourse.dart';

import 'package:my_first_app/countapp/data_class.dart';
import 'package:provider/provider.dart';

import '../courseapp/coursepage.dart';

void main() {
  runApp(const WhatsAppUI());
}

class WhatsAppUI extends StatelessWidget {
  const WhatsAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataClass()),
        ChangeNotifierProvider(create: (_) => ChangeCourse()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CourseApp(),
      ),
    );
  }
}
