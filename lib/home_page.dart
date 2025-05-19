import 'package:flutter/material.dart';
import 'package:my_first_app/data_class.dart';
import 'package:my_first_app/second_page.dart';
import 'package:provider/provider.dart';

 class HomePage extends StatefulWidget {
   const HomePage({super.key});
 
   @override
   State<HomePage> createState() => _HomePageState();
 }
 
 class _HomePageState extends State<HomePage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         leading: Icon(Icons.shopping_cart),
         actions: [Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("Shopping cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         )],
       ),
       body: Column(

         children: [
           SizedBox(height: 150,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 40),
             child: Row(
               children: [
                 Consumer<DataClass>(builder: (context,dataClass,child){
                  return Text("${dataClass.x}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
                 }),
                 Spacer(),
                 Text("Total",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),

               ],
             ),
           ),
           SizedBox(height: 50,),
           Padding(
             padding: const EdgeInsets.only(left: 28.0),
             child: Row(
               children: [GestureDetector(
                 child: Container(
                   height: 60,
                   width: 60,
                   child: Icon(Icons.add),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(
                       color: Colors.black,
                       width: 3,
                     )
                   ),
                 ),
                  onTap: (){
                   Provider.of<DataClass>(context,listen: false).incrementX();
                  }

               ),
                 Spacer(),
                 Padding(
                   padding: const EdgeInsets.only(right: 28.0),
                   child: Container(height: 60,width: 180,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           Text("Next Page",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                           SizedBox(width: 30,),
                           IconButton(onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
                           }, icon: Icon(Icons.skip_next,color: Colors.white,))
                         ],
                       ),
                     ),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.black
                     ),
                   ),
                 )
                       ],
             ),
           )
         ],
       ),
     );
   }
 }
 




