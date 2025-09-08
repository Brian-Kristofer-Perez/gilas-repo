import 'package:flutter/material.dart';


class TextLabel extends StatelessWidget {
  final String label;

  const TextLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}

class ExerciseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Barbell Press",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                TextLabel(label: "Label 1"),
                SizedBox(width: 8),
                TextLabel(label: "Label 2"),
              ],
            ),
          ],
        ),
        toolbarHeight: 80,
      ),
      body: Center(
        child: Text("Exercise content here"),
      ),
    );
  }
}