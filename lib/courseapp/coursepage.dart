import 'package:flutter/material.dart';
import 'package:my_first_app/courseapp/changecourse.dart';
import 'package:my_first_app/courseapp/mycourse.dart';
import 'package:provider/provider.dart';

class CourseApp extends StatelessWidget {
  CourseApp({super.key});

  final List<String> courseList = [
    "GetX",
    "Bloc",
    "Cubit",
    "Riverpod",
    "Provider",
    "Flutter Hooks"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5c67c1),
        title: const Text("Course Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
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
            const SizedBox(height: 30),
            const Text(
              "Available Courses",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: courseList.length,
                itemBuilder: (context, index) {
                  return MyCourse(course: courseList[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("Adding course!")),
          );
        },
        label:  Text("Add Course"),
        icon:  Icon(Icons.add),
        backgroundColor:  Color(0xFF5c67c1),
      ),
    );
  }
}
