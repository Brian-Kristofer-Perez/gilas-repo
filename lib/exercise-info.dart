import 'package:flutter/material.dart';

class ExerciseInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            // pop the navigation stack
          },
        ),
        title: Column(
          children: [
            SizedBox(width: 30,),
            Text("Barbell Press")
          ],
        ), // title
      ),
    );
  }

}
