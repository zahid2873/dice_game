import 'package:dice_game/constants.dart';
import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Game Rules"),
      ),
      body : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Text("Description",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
            Text('Description : $description', style: TextStyle(fontSize: 18)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30,),
              child: Text("Rules", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
            ),
            Text(rule1,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
            Text(rule2,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
            Text(rule3,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
            Text(rule4,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
            Text(rule5,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
