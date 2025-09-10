import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BenefitsList extends StatelessWidget {
  final List<String> benefits;

  const BenefitsList({
    Key? key,
    required this.benefits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...benefits.map((benefit) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                const Icon(Icons.check_circle, size: 20, color: Colors.green),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    benefit,
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

class InstructionList extends StatelessWidget {
  final List<String> instructions;
  final List<String> tips;

  const InstructionList({
    Key? key,
    required this.instructions,
    required this.tips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Note: Data is hardcoded json, but good practice anyway just to be safe
    assert(
    instructions.length == tips.length,
    "Instructions and tips must have the same length",
    );

    return Column(
      children: List.generate(instructions.length, (index) {
        return InstructionCard(
          step: (index + 1).toString(),
          instruction: instructions[index],
          tip: tips[index],
        );
      }),
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
  final Color color;

  const ContentCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.children,
    this.color = Colors.black
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
                      fontSize: 20,
                      color: color
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
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
      child: Container(
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
      )
    );
  }
}

class LabelList extends StatelessWidget {
  final List<String> labels;

  const LabelList({
    Key? key,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: labels
          .map((text) => TextLabel(label: text))
          .toList(),
    );
  }
}

class ExerciseInfo extends StatelessWidget {

  final Map<String, dynamic> exercise;

  const ExerciseInfo({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6F0FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        shadowColor: Colors.black,
        toolbarHeight: 80,
        leading: SizedBox(width:240),
        title: Padding(
          padding: EdgeInsets.only(
              left:80,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise["name"],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  LabelList(
                      labels: [exercise["category"], exercise["muscle_groups"][0]]
                  ),
                ],
              ),
            ],
          )
        )
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 150),
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
                    Expanded(
                      child:
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
                            LabelList(
                              labels: List<String>.from(exercise["muscle_groups"])
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 100),

                    Expanded(child:
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

                            LabelList(
                              labels: List<String>.from(exercise["equipment"])
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30,),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.indigo
                    ),
                    color: Colors.indigoAccent.withAlpha(20),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                            "Focus on controlled movement and full range of motion",
                            style: TextStyle(
                                color: Colors.indigo
                            ),
                        )
                      ]
                    )
                  )
                )
              ],
            ),
            
            SizedBox(height: 30,),
            
            ContentCard(
                icon: SvgPicture.asset(
                  "assets/icons/check-circle-svgrepo-com.svg",
                  width: 20,
                  height: 20,
                ),
                title: "Step-by-step Instructions",
                children: [
                  InstructionList(
                    instructions: (exercise["step_by_step"] as List<dynamic>)
                        .map((e) => (e as Map<String, dynamic>)["step"] as String)
                        .toList(),
                    tips: (exercise["step_by_step"] as List<dynamic>)
                        .map((e) => (e as Map<String, dynamic>)["tips"] as String)
                        .toList(),
                  ),
                ]
            ),

            SizedBox(height: 30,),

            ContentCard(
                icon: SvgPicture.asset(
                  "assets/icons/warning-svgrepo-com.svg",
                  width: 25,
                  height: 25,
                  color: Colors.red,
                ),
                title: "Common Mistakes",
                color: Colors.red,
                children: [
                  MistakesList(
                      mistakes: List<String>.from(exercise["common_mistakes"])
                  )
                ]
            ),

            SizedBox(height: 30,),

            ContentCard(
                icon: SvgPicture.asset(
                  "assets/icons/lightning-svgrepo-com.svg",
                  width: 25,
                  height: 25,
                  color: Colors.green,
                ),
                title: "Benefits",
                color: Colors.green,
                children: [
                  Column(children: [
                    BenefitsList(
                      benefits: List<String>.from(exercise["benefits"])
                    )
                  ],)
                ]
            ),

          ]
        ),
      ),
    );
  }
}