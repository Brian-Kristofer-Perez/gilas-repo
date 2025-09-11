import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Exercise {
  final String name;
  final String description;
  final String sets;
  final String reps;
  final List<String> muscleGroups;
  final String category;

  Exercise({
    required this.name,
    required this.description,
    required this.sets,
    required this.reps,
    required this.muscleGroups,
    required this.category,
  });

  // Factory constructor to create Exercise from JSON
  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      sets: json['sets'] ?? '',
      reps: json['reps'] ?? '',
      muscleGroups: List<String>.from(json['muscle_groups']),
      category: json['category'] ?? '',
    );
  }

  // Convert Exercise to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'sets': sets,
      'reps': reps,
    };
  }
}

String toSnakeCase(String text) {
  return text
      .replaceAll(RegExp(r'[\s-]+'), '_')
      .toLowerCase();
}

class HoverPlayIcon extends StatefulWidget {
  const HoverPlayIcon({super.key});

  @override
  _HoverPlayIconState createState() => _HoverPlayIconState();
}

class _HoverPlayIconState extends State<HoverPlayIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Icon(
        Icons.play_circle_fill,
        size: 48,
        color: _isHovered ? Colors.black : Colors.grey,
      ),
    );
  }
}

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> categories = ['Push', 'Pull', 'Leg'];
  Map<String, Map<String, List<Exercise>>> exercisesByCategory = {};
  bool isLoading = true;
  Set<String> expandedMuscleGroups = {}; // Track which muscle groups are expanded
  Set<String> hoveredCards = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _loadAndSetExercises();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadAndSetExercises() async {
    final loadedExercises = await loadExercisesFromJson();
    setState(() {
      exercisesByCategory = loadedExercises;
      isLoading = false;
    });
  }

  // Load exercises from JSON asset
  Future<Map<String, Map<String, List<Exercise>>>> loadExercisesFromJson() async {
    final String response = await rootBundle.loadString('assets/exercises.json');
    final Map<String, dynamic> data = json.decode(response);

    Map<String, Map<String, List<Exercise>>> exercises = {};

    data.forEach((key, value) {
      final exercise = Exercise.fromJson(value as Map<String, dynamic>);

      exercises.putIfAbsent(exercise.category, () => {});
      for (var mg in exercise.muscleGroups) {
        exercises[exercise.category]!.putIfAbsent(mg, () => []);
        exercises[exercise.category]![mg]!.add(exercise);
      }
    });

    return exercises;
  }

  List<Exercise> getAllExercisesForCategory(String category) {
    List<Exercise> allExercises = [];
    final muscleGroups = exercisesByCategory[category.toLowerCase()] ?? {};
    
    muscleGroups.forEach((muscleGroup, exercises) {
      allExercises.addAll(exercises);
    });
    
    return allExercises;
  }

  String get currentCategory => categories[_tabController.index];

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE6F0FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.black,
        toolbarHeight: 80,
        leadingWidth: 220,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          label: const Text(
            'Back to Home',
            style: TextStyle(color: Colors.black),
          ),
        ),
        title: Container(
          height: 80, 
          alignment: Alignment.centerLeft, 
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                Icons.fitness_center,
                color: Colors.grey.shade600,
                size: 30,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Gym Workouts',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Your complete exercise guide',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            color: const Color(0xFFE6F0FA),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  dividerColor: Colors.transparent,
                  tabs: categories.map((category) => Tab(
                    child: Container(
                      child: Text(category),
                    ),
                  )).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController!,
        physics: const NeverScrollableScrollPhysics(),
        children: categories.map((category) => _buildCategoryContent(category)).toList(),
      ),
    );
  }

  Widget _buildCategoryContent(String category) {
    final currentMuscleGroups = exercisesByCategory[category.toLowerCase()] ?? {};
    final allCurrentExercises = getAllExercisesForCategory(category);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFeaturedSection(allCurrentExercises),
            const SizedBox(height: 22),
            _buildMuscleGroupsSection(currentMuscleGroups),
          ],
        ),
      ),
    );
  }

  // Fixed muscle groups section without Expanded and its own scrolling
  Widget _buildMuscleGroupsSection(Map<String, List<Exercise>> muscleGroups) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: muscleGroups.keys.map((muscleGroup) {
            final exercises = muscleGroups[muscleGroup]!;
            final isExpanded = expandedMuscleGroups.contains(muscleGroup);

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isExpanded) {
                          expandedMuscleGroups.remove(muscleGroup);
                        } else {
                          expandedMuscleGroups.add(muscleGroup);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.fitness_center,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              muscleGroup.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '${exercises.length} exercises',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isExpanded)
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Column(
                        children: exercises.map((exercise) => _buildExerciseItem(exercise, context)).toList(),
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildExerciseItem(Exercise exercise, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "exercises/${toSnakeCase(exercise.name)}"),
      child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  exercise.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Sets: ${exercise.sets}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.0,
                  ),
                ),
                child: Text(
                  'Reps: ${exercise.reps}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )
    );
  }

  Widget _buildFeaturedSection(List<Exercise> exercises) {
    if (exercises.isEmpty) {
      return const SizedBox.shrink();
    }

    final limitedExercises = exercises.take(5).toList();

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.orange, size: 20),
                SizedBox(width: 8),
                Text(
                  'Featured Exercises',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: limitedExercises.length,
                itemBuilder: (context, index) {
                  final exercise = limitedExercises[index];
                  return Container(
                    width: 340,
                    margin: const EdgeInsets.only(right: 16),
                    child: _buildFeaturedCard(exercise, context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(Exercise exercise, BuildContext context) {
    final isHovered = hoveredCards.contains(exercise.name);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hoveredCards.add(exercise.name)),
      onExit: (_) => setState(() => hoveredCards.remove(exercise.name)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(16),
        transform: isHovered
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(isHovered ? 0.2 : 0.1),
              blurRadius: isHovered ? 20.0 : 10.0,
              offset: Offset(0, isHovered ? 6.0 : 2.0),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Main card content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  exercise.muscleGroups.join(", "),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Sets: ${exercise.sets}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        'Reps: ${exercise.reps}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Flexible(
                  child: Text(
                    exercise.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/exercises/${toSnakeCase(exercise.name)}"),
                child: HoverPlayIcon()
              )
            ),
          ],
        ),
      ),
    );
  }
}