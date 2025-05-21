import 'package:flutter/material.dart';
import 'package:my_first_app/courseapp/changecourse.dart';
import 'package:my_first_app/courseapp/mycourse.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(create: (_)=>ChangeCourse(),
  child: courseapp(),));
}
class courseapp extends StatefulWidget {
  const courseapp({super.key});

  @override
  State<courseapp> createState() => _courseappState();
}

class _courseappState extends State<courseapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70,left: 20,right: 20 ),
              width: double.maxFinite,
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFF5c67c1),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text("We are Learning" + Provider.of<ChangeCourse>(context).subject,
                style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            ),
            Mycourse(course: "GetX",),
            Mycourse(course: "Bloc",),
            Mycourse(course: "Cubit",),
          ],
        ),
      ),
    );
  }
}
