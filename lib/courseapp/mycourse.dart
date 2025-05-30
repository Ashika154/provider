import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'changecourse.dart';

class MyCourse extends StatelessWidget {
  final String course;

  const MyCourse({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ChangeCourse>(context, listen: false)
            .changeSubjects(course);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$course selected')),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF5c67c1), Color(0xFF3f4c9f)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 4),
            ),
          ],
          
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            course,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
