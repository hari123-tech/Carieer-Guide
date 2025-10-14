import 'package:flutter/material.dart';
// Update path if necessary. Ensure culinarycollege.dart defines CulinaryArtsCollegesPage.
import 'culinarycollege.dart';

class CulinaryArtsPage extends StatelessWidget {
  final String category;

  CulinaryArtsPage({required this.category});

  final List<Map<String, dynamic>> courseList = [
    {
      'name': 'Professional Culinary Arts',
      'duration': '1 Year',
      'description':
          'Covers all aspects of professional cooking, baking, and kitchen management.',
      'governmentJobs': [
        'Catering Supervisor (Government Canteens)',
        'Food Safety Inspector (Municipal Health Dept.)'
      ],
      'privateJobs': [
        'Sous Chef',
        'Commis Chef',
        'Kitchen Supervisor',
        'Culinary Instructor'
      ]
    },
    {
      'name': 'Diploma in Baking & Pastry Arts',
      'duration': '6 Months',
      'description':
          'Specializes in bakery and dessert preparation techniques with hands-on training.',
      'governmentJobs': [
        'Bakery Trainer (Skill Development Centers)',
        'Food Examiner (Government Labs)'
      ],
      'privateJobs': [
        'Pastry Chef',
        'Baker',
        'Cake Designer',
        'Bakery Production Supervisor'
      ]
    },
    {
      'name': 'International Cuisine Course',
      'duration': '3 Months',
      'description':
          'Focuses on global food cultures, techniques, and international dishes.',
      'governmentJobs': [
        'Culinary Trainer (Government Tourism Programs)'
      ],
      'privateJobs': [
        'International Cuisine Chef',
        'Menu Developer',
        'Executive Chef (Specialty Restaurants)'
      ]
    },
    {
      'name': 'Vegetarian Culinary Course',
      'duration': '2 Months',
      'description':
          'Teaches plant-based cooking styles and creative vegetarian recipes.',
      'governmentJobs': [
        'Community Nutrition Worker (Public Health Programs)'
      ],
      'privateJobs': [
        'Vegetarian Chef',
        'R&D Chef (Plant-based Foods)',
        'Café Chef'
      ]
    },
    {
      'name': 'Advanced Culinary Techniques',
      'duration': '4 Months',
      'description':
          'Enhances knife skills, plating, and gourmet meal preparation.',
      'governmentJobs': [
        'Culinary Instructor (Vocational/ITI Centers)'
      ],
      'privateJobs': [
        'Chef de Partie',
        'Garde Manger',
        'Food Stylist',
        'Private Chef'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.red,
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to the colleges page.
              // Make sure culinarycollege.dart defines `CulinaryArtsCollegesPage`.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CulinaryArtsCollegesPage(),
                ),
              );
            },
            child: Text(
              "Colleges",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          final course = courseList[index];
          final governmentJobs =
              List<String>.from(course['governmentJobs'] ?? []);
          final privateJobs = List<String>.from(course['privateJobs'] ?? []);

          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['name'] ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Duration: ${course['duration']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    course['description'] ?? '',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Government Jobs:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  governmentJobs.isEmpty
                      ? Text('No common government roles listed.')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: governmentJobs.map((job) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('• '),
                                  Expanded(child: Text(job)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                  SizedBox(height: 12),
                  Text(
                    'Private Jobs:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  privateJobs.isEmpty
                      ? Text('No common private roles listed.')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: privateJobs.map((job) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('• '),
                                  Expanded(child: Text(job)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




