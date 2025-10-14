import 'package:flutter/material.dart';
import 'Animation&MultimediaCollege.dart'; // ✅ Ensure this file/class exists

class AnimationMultimediaCourse extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      'name': 'Diploma in Animation',
      'duration': '1 Year',
      'benefits':
          'Learn 2D & 3D animation, character design, and motion graphics.',
      'governmentJobs': [
        'Graphic Designer in Govt Media Dept',
        'Animation Assistant (Doordarshan)'
      ],
      'privateJobs': ['2D Animator', '3D Animator', 'VFX Artist']
    },
    {
      'name': 'B.Sc in Animation and Multimedia',
      'duration': '3 Years',
      'benefits':
          'Covers full animation pipeline, VFX, game design, and digital art.',
      'governmentJobs': [
        'Animator (Govt Education Content)',
        'Multimedia Trainer (Skill India)'
      ],
      'privateJobs': ['Animator', 'Multimedia Designer', 'Game Designer']
    },
    {
      'name': 'Certificate in Graphic & Web Design',
      'duration': '6 Months',
      'benefits':
          'Focus on Photoshop, Illustrator, UI/UX basics, and web animations.',
      'governmentJobs': ['Junior Designer (Govt Web Portals)'],
      'privateJobs': ['Graphic Designer', 'UI Designer']
    },
    {
      'name': 'M.Sc in Animation & VFX',
      'duration': '2 Years',
      'benefits':
          'Advanced animation, visual effects, film compositing, and CGI.',
      'governmentJobs': [
        'Media Specialist (Govt Projects)',
        'E-learning Content Developer'
      ],
      'privateJobs': ['VFX Supervisor', 'Compositing Artist', 'CG Supervisor']
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation & Multimedia'),
        backgroundColor: Colors.deepPurple,
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AnimationMultimediaCollegesPage(),
                ),
              );
            },
            icon: Icon(Icons.school, color: Colors.white),
            label: Text(
              'Colleges',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course['name'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Duration: ${course['duration']}',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Benefits:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(course['benefits'], style: TextStyle(fontSize: 15)),
                  SizedBox(height: 12),
                  Text('Government Job Opportunities:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  ...List<String>.from(course['governmentJobs']).map(
                    (job) => Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text('• $job'),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text('Private Job Opportunities:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  ...List<String>.from(course['privateJobs']).map(
                    (job) => Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text('• $job'),
                    ),
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
