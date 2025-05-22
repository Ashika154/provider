import 'package:flutter/material.dart';
import 'package:my_first_app/courseapp/changecourse.dart';
import 'package:my_first_app/courseapp/mycourse.dart';
import 'package:provider/provider.dart';

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
            width: double.maxFinite,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF5c67c1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Consumer<ChangeCourse>(
                builder: (context, changeCourse, child) {
                  return Text(
                    "We are Learning ${changeCourse.subject}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  );
                },
              ),
            ),
          ),
          const MyCourse(course: "GetX"),
          const MyCourse(course: "Bloc"),
          const MyCourse(course: "Cubit"),
        ],
      ),
    );
  }
}
