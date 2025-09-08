import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ContentCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final List<Widget> children;

  const ContentCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.children
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  SizedBox(width: 8),
                  Text(
                      title,
                      style: TextStyle(
                        fontSize: 20
                      ),
                  )
                ],
              ),
              SizedBox(height: 20),
              ...children
            ],
          ),
        )
      );
  }
}


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
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11),
      ),
    );
  }
}

class ExerciseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        shadowColor: Colors.black,
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
        child: Column(
          children: [
            ContentCard(
              icon: SvgPicture.asset(
                "assets/icons/target-svgrepo-com.svg",
                width: 20,
                height: 20,
              ),
              title: "Exercise Overview",
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/dumbbell-large-svgrepo-com.svg',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Target Muscles",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
                  ],
                )
              ],
            )
          ]
        )
      ),
      backgroundColor: Color(0xFFE6F0FA),
    );
  }
}