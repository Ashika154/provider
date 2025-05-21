import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/countapp/data_class.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_cart),
        actions: [Padding(
          padding:  EdgeInsets.all(8.0),
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
            padding:  EdgeInsets.only(left: 28.0),
            child: Row(
              children: [GestureDetector(
                onTap: () {
                  if (Provider.of<DataClass>(context, listen: false).x>0) {
                    Provider.of<DataClass>(context, listen: false).decrementX();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              "Item",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "It can't be less than this.",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  child:  Icon(Icons.minimize),
                ),
              ),
                Spacer(),
                Padding(
                  padding:  EdgeInsets.only(right: 28.0),
                  child: Container(height: 60,width: 180,
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(Icons.skip_previous,color: Colors.white,)),
                          SizedBox(width: 40,),
                          Text("prev Page",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
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





