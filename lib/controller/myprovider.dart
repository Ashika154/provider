import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
class MyProvider extends StatelessWidget {
  const MyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<MyProviderController>(
            builder:(_,myProvider,child){
              return Center(child: Text('Current value is ''${context.read<MyProviderController>().x}'),
              );

            }

            ),
          TextButton(onPressed: ()=>context.read<MyProviderController>().incrementX(), child: Text("Tap me"))

        ],
      ),
    );
  }
}
