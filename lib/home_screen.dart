import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              // Header Section - Centered
              Container(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Icon(
                        Icons.fitness_center,
                        size: 48,
                        color: Colors.blue[700],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Your Ultimate',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF2196F3),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Text(
                      'Gym Companion',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Discover expertly crafted workouts for every muscle group. From push and pull movements to legs and core, we\'ve got your complete training covered.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF666666),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 3,
                        shadowColor: Colors.blue.withOpacity(0.4),
                      ),
                      child: const Text(
                        'Start Your Workout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Stats Row - Centered
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStatCard(
                          number: '50+',
                          label: 'Total Exercises',
                          icon: Icons.fitness_center,
                        ),
                        const SizedBox(width: 20),
                        _buildStatCard(
                          number: '8',
                          label: 'Muscle Groups',
                          icon: Icons.adjust,
                        ),
                        const SizedBox(width: 20),
                        _buildStatCard(
                          number: '3',
                          label: 'Workout Types',
                          icon: Icons.trending_up,
                        ),
                        const SizedBox(width: 20),
                        _buildStatCard(
                          number: 'All',
                          label: 'Training Goals',
                          icon: Icons.emoji_events,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Main Content - Two columns layout
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column - Training Focus and Exercises
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        // Training Focus Section
                        Container(
                          padding: const EdgeInsets.fromLTRB(50, 32, 50, 48),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Choose Your Training Focus',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Each workout category is designed to target specific muscle groups with proven exercises',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildWorkoutCard(
                                      title: 'Push Workouts',
                                      subtitle: 'Chest, Shoulders & Triceps',
                                      exerciseCount: '15 exercises',
                                      color: const Color(0xFF2196F3),
                                      icon: Icons.arrow_upward,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: _buildWorkoutCard(
                                      title: 'Pull Workouts',
                                      subtitle: 'Back & Biceps',
                                      exerciseCount: '12 exercises',
                                      color: const Color(0xFF00BCD4),
                                      icon: Icons.arrow_downward,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: _buildWorkoutCard(
                                      title: 'Legs & Core',
                                      subtitle: 'Lower Body & Core Strength',
                                      exerciseCount: '18 exercises',
                                      color: const Color(0xFF9C27B0),
                                      icon: Icons.directions_run,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Popular Exercises Section
                        Container(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Popular Exercises',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'See All',
                                        style: TextStyle(
                                          color: Color(0xFF2196F3),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xFF2196F3),
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              _buildExerciseItem(
                                title: 'Barbell Bench Press',
                                category: 'Chest',
                                sets: '4 sets',
                                reps: '6-8 reps',
                                description:
                                    'The king of chest exercises - focus on controlled movement',
                              ),
                              const SizedBox(height: 20),
                              const Divider(height: 1, color: Color(0xFFEEEEEE)),
                              const SizedBox(height: 20),
                              _buildExerciseItem(
                                title: 'Pull-ups',
                                category: 'Back',
                                sets: '4 sets',
                                reps: '6-10 reps',
                                description:
                                    'Ultimate back builder - use assistance if needed',
                              ),
                              const SizedBox(height: 20),
                              const Divider(height: 1, color: Color(0xFFEEEEEE)),
                              const SizedBox(height: 20),
                              _buildExerciseItem(
                                title: 'Squats',
                                category: 'Legs',
                                sets: '4 sets',
                                reps: '8-10 reps',
                                description:
                                    'Foundation of leg strength - go as deep as mobility allows',
                              ),
                              const SizedBox(height: 20),
                              const Divider(height: 1, color: Color(0xFFEEEEEE)),
                              const SizedBox(height: 20),
                              _buildExerciseItem(
                                title: 'Overhead Press',
                                category: 'Shoulders',
                                sets: '4 sets',
                                reps: '6-8 reps',
                                description: 'Build strong shoulders - keep core tight',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 24),

                  // Right Column - Muscle Groups and Beginner Friendly
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // Browse by Muscle Group Section
                        Container(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Browse by Muscle Group',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: _buildMuscleGroupChip('Chest', '4 exercises')),
                                      const SizedBox(width: 12),
                                      Expanded(child: _buildMuscleGroupChip('Shoulders', '4 exercises')),
                                      const SizedBox(width: 12),
                                      Expanded(child: _buildMuscleGroupChip('Triceps', '4 exercises')),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(child: _buildMuscleGroupChip('Back', '5 exercises')),
                                      const SizedBox(width: 12),
                                      Expanded(child: _buildMuscleGroupChip('Biceps', '4 exercises')),
                                      const SizedBox(width: 12),
                                      Expanded(child: _buildMuscleGroupChip('Legs', '5 exercises')),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(child: _buildMuscleGroupChip('Glutes', '4 exercises')),
                                      const SizedBox(width: 12),
                                      Expanded(child: _buildMuscleGroupChip('Core', '5 exercises')),
                                      const SizedBox(width: 12),
                                      Expanded(child: Container()), // Empty space to maintain alignment
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Beginner Friendly Section
                        Container(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Beginner Friendly',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'See All',
                                        style: TextStyle(
                                          color: Color(0xFF2196F3),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xFF2196F3),
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _buildBeginnerExerciseCard(
                                      title: 'Push-ups',
                                      category: 'Chest',
                                      sets: '3 sets',
                                      reps: '8-12 reps',
                                      description: 'Start with knee push-ups if needed',
                                    ),
                                    const SizedBox(width: 16),
                                    _buildBeginnerExerciseCard(
                                      title: 'Bodyweight Squats',
                                      category: 'Legs',
                                      sets: '3 sets',
                                      reps: '12-15 reps',
                                      description: 'Focus on proper form and depth',
                                    ),
                                    const SizedBox(width: 16),
                                    _buildBeginnerExerciseCard(
                                      title: 'Assisted Pull-ups',
                                      category: 'Back',
                                      sets: '3 sets',
                                      reps: '5-8 reps',
                                      description: 'Use band or machine assistance',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Why Choose Our App Section
                        Container(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                  'Why Choose Our App',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              _buildFeatureItem(
                                title: 'Targeted Training',
                                description:
                                    'Every exercise is carefully selected to maximize muscle group development.',
                              ),
                              const SizedBox(height: 20),
                              _buildFeatureItem(
                                title: 'Expert Guidance',
                                description:
                                    'Detailed form notes and rep ranges from fitness professionals.',
                              ),
                              const SizedBox(height: 20),
                              _buildFeatureItem(
                                title: 'Progressive Training',
                                description:
                                    'Structured workouts that grow with your fitness level',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String number,
    required String label,
    required IconData icon,
  }) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 18,
              color: Colors.blue[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String subtitle,
    required String exerciseCount,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              exerciseCount,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: color,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: color.withOpacity(0.3), width: 1.5),
                ),
                elevation: 0,
              ),
              child: const Text('Explore Exercises'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseItem({
    required String title,
    required String category,
    required String sets,
    required String reps,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.fitness_center,
            color: Colors.blue[700],
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF2196F3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      sets,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      reps,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMuscleGroupChip(String muscleGroup, String exerciseCount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            muscleGroup,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2196F3),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            exerciseCount,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBeginnerExerciseCard({
    required String title,
    required String category,
    required String sets,
    required String reps,
    required String description,
  }) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF2196F3),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  sets,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  reps,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const GILASApp());
}

class GILASApp extends StatelessWidget {
  const GILASApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}