import 'package:flutter/material.dart';
import 'package:my_first_app/courseapp/changecourse.dart';
import 'package:my_first_app/courseapp/mycourse.dart';
import 'package:provider/provider.dart';

class CourseApp extends StatelessWidget {
   CourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor:  Color(0xFF5c67c1),
        title:  Text("Course Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
               SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                height: 70,
                decoration: BoxDecoration(
                  color:  Color(0xFF5c67c1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Consumer<ChangeCourse>(
                    builder: (context, changeCourse, child) {
                      return Text(
                        "We are Learning ${changeCourse.subject}",
                        style:  TextStyle(fontSize: 20, color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
               SizedBox(height: 30),
               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Available Courses",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
               SizedBox(height: 10),
               MyCourse(course: "GetX"),
               MyCourse(course: "Bloc"),
               MyCourse(course: "Cubit"),
               MyCourse(course: "Riverpod"),
               MyCourse(course: "Provider"),
               MyCourse(course: "Flutter Hooks"),
               SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("Adding course!")),
                  );
                },
                icon:  Icon(Icons.add,color: Colors.white,),
                label:  Text("Add Course",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF5c67c1),
                  padding:  EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
               SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
