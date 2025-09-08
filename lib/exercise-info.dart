import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MistakesList extends StatelessWidget {
  final List<String> mistakes;

  const MistakesList({
    Key? key,
    required this.mistakes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...mistakes.map((mistake) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                const Icon(Icons.circle, size: 8, color: Colors.red),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    mistake,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}

class InstructionCard extends StatelessWidget {
  final String step;
  final String instruction;
  final String tip;

  const InstructionCard({
    Key? key,
    required this.step,
    required this.instruction,
    required this.tip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black,
                child: Text(
                  step,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  instruction,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.yellow[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tip,
                      style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      color: Colors.white,
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
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xD0C0C0C0),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class ExerciseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6F0FA),
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
        child: ListView(
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

                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/muscle-svgrepo-com.svg',
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Target Muscles",
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextLabel(label: "Chest"),
                              SizedBox(width: 8),
                              TextLabel(label: "Front Deltoids"),
                              SizedBox(width: 8),
                              TextLabel(label: "Triceps"),
                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(width: 100),

                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                "Equipment Needed",
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextLabel(label: "Barbell"),
                              SizedBox(width: 8),
                              TextLabel(label: "Bench"),
                              SizedBox(width: 8),
                              TextLabel(label: "Safety Rack"),
                            ],
                          )
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 30,),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.cyan
                    ),
                    color: Colors.cyan.withAlpha(20),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Focus on controlled movement and full range of motion",
                        style: TextStyle(
                            color: Colors.cyan
                        ),
                    )
                  )
                )
              ],
            ),
            
            SizedBox(height: 30,),
            
            ContentCard(
                icon: SvgPicture.asset(
                  "assets/icons/target-svgrepo-com.svg",
                  width: 20,
                  height: 20,
                ),
                title: "Hello world", 
                children: [
                  Column(children: [
                    InstructionCard(step: '1', instruction: "sample text", tip: "sample tip"),
                    InstructionCard(step: '2', instruction: "sample text", tip: "sample tip"),
                    InstructionCard(step: '3', instruction: "sample text", tip: "sample tip"),
                    InstructionCard(step: '4', instruction: "sample text", tip: "sample tip"),
                    InstructionCard(step: '5', instruction: "sample text", tip: "sample tip"),
                    InstructionCard(step: '6', instruction: "sample text", tip: "sample tip"),
                    InstructionCard(step: '7', instruction: "sample text", tip: "sample tip"),
                  ],)
                ]
            ),

            SizedBox(height: 30,),

            ContentCard(
                icon: SvgPicture.asset(
                  "assets/icons/target-svgrepo-com.svg",
                  width: 20,
                  height: 20,
                ),
                title: "Hello world",
                children: [
                  MistakesList(mistakes: [
                    "Bouncing the bar off the chest",
                    "Flaring elbows too wide",
                    "Not maintaining proper back arch",
                    "Uneven bar path",
                    "Lifting feet off the ground",
                    ]
                  )
                ]
            ),
          ]
        ),
      ),
    );
  }
}