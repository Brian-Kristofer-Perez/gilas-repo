import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/exercise-info.dart';
import 'package:flutter_app_demo/exercises.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/home_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final jsonString = await rootBundle.loadString('assets/exercises.json');
  final exerciseList = jsonDecode(jsonString) as Map<String, dynamic>;

  runApp(MyApp(exerciseList: exerciseList));
}

class MyApp extends StatelessWidget {

  final Map<String, dynamic> exerciseList;

  const MyApp({
    super.key,
    required this.exerciseList
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      routes: {
        '/': (context) => HomeScreen(),
        '/exercises': (context) => ExercisePage(),
      },
      onGenerateRoute: (settings) {

        final route = Uri.parse(settings.name ?? '/');

        if(route.pathSegments.isEmpty){
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }

        if (route.pathSegments.first == 'exercises') {
          // /exercises
          if (route.pathSegments.length == 1) {
            return MaterialPageRoute(builder: (_) => ExercisePage());
          }

          else if (route.pathSegments.length == 2) {
            // /exercises/:exercise
            final id = route.pathSegments[1];

            try {
              final exercise = exerciseList[id];

              if (exercise == null) {
                return MaterialPageRoute(
                  builder: (_) => const Text("Exercise not found"),
                );
              }

              return MaterialPageRoute(
                builder: (_) => ExerciseInfo(exercise: exercise),
              );
            } catch (e) {
              return MaterialPageRoute(
                builder: (_) => Text("Error loading exercise: $e"),
              );
            }
          }

          return MaterialPageRoute(builder: (_) => Text("Invalid Page"));
        }

        return MaterialPageRoute(builder: (_) => Text("Invalid Page"));
      }
    );
  }
}