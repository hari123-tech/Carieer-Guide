import 'package:flutter/material.dart';

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
      'governmentJobs': ['Culinary Trainer (Government Tourism Programs)'],
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
      'governmentJobs': ['Community Nutrition Worker (Public Health Programs)'],
      'privateJobs': ['Vegetarian Chef', 'R&D Chef (Plant-based Foods)', 'Café Chef']
    },
    {
      'name': 'Advanced Culinary Techniques',
      'duration': '4 Months',
      'description':
          'Enhances knife skills, plating, and gourmet meal preparation.',
      'governmentJobs': ['Culinary Instructor (Vocational/ITI Centers)'],
      'privateJobs': ['Chef de Partie', 'Garde Manger', 'Food Stylist', 'Private Chef']
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CulinaryArtsCollegesPage()),
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
          final governmentJobs = List<String>.from(course['governmentJobs'] ?? []);
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

class CulinaryArtsCollegesPage extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> tamilNaduCulinaryColleges = {
    'Chennai': [
      {
        'name': 'Chennai Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts', 'International Cuisine Course']
      },
      {
        'name': 'Madras School of Culinary Arts',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Seaside Culinary Academy',
        'courses': ['Diploma in Baking & Pastry Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'City Centre Institute of Hospitality',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'St. Marys Culinary School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Chef\'s Corner Academy',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'South Chennai Culinary Institute',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'Chennai Pastry & Baking School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Harbour Hospitality & Culinary',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Heritage Culinary Academy',
        'courses': ['International Cuisine Course', 'Advanced Culinary Techniques']
      },
    ],
    'Coimbatore': [
      {
        'name': 'Coimbatore Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'PSG School of Culinary Arts',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Coimbatore Pastry Academy',
        'courses': ['Diploma in Baking & Pastry Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'City Culinary Centre, Coimbatore',
        'courses': ['International Cuisine Course', 'Professional Culinary Arts']
      },
      {
        'name': 'Lakshmi Hospitality & Culinary',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Central Culinary Institute',
        'courses': ['Advanced Culinary Techniques', 'International Cuisine Course']
      },
      {
        'name': 'Westway Chef Academy',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Coimbatore School of Baking',
        'courses': ['Diploma in Baking & Pastry Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Grace Culinary College',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'Greenfield Culinary School',
        'courses': ['Vegetarian Culinary Course', 'Diploma in Baking & Pastry Arts']
      },
    ],
    'Madurai': [
      {
        'name': 'Madurai Culinary Academy',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Meenakshi School of Baking',
        'courses': ['Diploma in Baking & Pastry Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Madurai International Cuisine Centre',
        'courses': ['International Cuisine Course', 'Professional Culinary Arts']
      },
      {
        'name': 'Southern Pastry Institute',
        'courses': ['Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Vasantham Culinary School',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Lotus Culinary Academy',
        'courses': ['Advanced Culinary Techniques', 'International Cuisine Course']
      },
      {
        'name': 'Madurai Hospitality & Culinary School',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Sankara Culinary Centre',
        'courses': ['Vegetarian Culinary Course', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Pastry Arts Academy',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
      {
        'name': 'Heritage Culinary Institute, Madurai',
        'courses': ['International Cuisine Course', 'Advanced Culinary Techniques']
      },
    ],
    'Tiruchirappalli': [
      {
        'name': 'Trichy Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Bharathidasan Culinary School',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'Rockfort Pastry & Bakery School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Kaveri Culinary Academy',
        'courses': ['Vegetarian Culinary Course', 'Professional Culinary Arts']
      },
      {
        'name': 'Trichy International Cuisine Centre',
        'courses': ['International Cuisine Course', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Central Trichy Chef School',
        'courses': ['Professional Culinary Arts']
      },
      {
        'name': 'Riverfront Pastry Institute',
        'courses': ['Diploma in Baking & Pastry Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'St. Joseph Culinary Arts',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Trichy Vocational Culinary Centre',
        'courses': ['Diploma in Baking & Pastry Arts', 'International Cuisine Course']
      },
      {
        'name': 'Gandhi Memorial Culinary Academy',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
    ],
    'Salem': [
      {
        'name': 'Salem Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Bannari Pastry School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Salem International Cuisine Centre',
        'courses': ['International Cuisine Course', 'Professional Culinary Arts']
      },
      {
        'name': 'Greenfields Culinary Academy',
        'courses': ['Vegetarian Culinary Course', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Sri Lakshmi Culinary School',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Salem Chef Training Centre',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Velocity Pastry Academy',
        'courses': ['Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Pavilion Culinary Institute',
        'courses': ['International Cuisine Course', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Heritage Pastry School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
      {
        'name': 'Salem Vocational Culinary Centre',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
    ],
    'Erode': [
      {
        'name': 'Erode Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Erode Pastry Academy',
        'courses': ['Diploma in Baking & Pastry Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Kandasamy Culinary School',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Riverside Culinary Centre',
        'courses': ['International Cuisine Course', 'Professional Culinary Arts']
      },
      {
        'name': 'Nimra Pastry & Baking School',
        'courses': ['Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Erode City Chef Academy',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Sundaram Culinary Institute',
        'courses': ['Vegetarian Culinary Course', 'International Cuisine Course']
      },
      {
        'name': 'Heritage Pastry Institute, Erode',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
      {
        'name': 'Green Valley Culinary School',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Erode Vocational Culinary Centre',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
    ],
    'Tirunelveli': [
      {
        'name': 'Tirunelveli Culinary Academy',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'Nadar Pastry School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Thamirabarani Chef Institute',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Palayamkottai Culinary Centre',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
      {
        'name': 'Coastal Pastry & Culinary School',
        'courses': ['Diploma in Baking & Pastry Arts', 'International Cuisine Course']
      },
      {
        'name': 'Evergreen Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Siva Culinary School',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Manonmaniam Pastry Centre',
        'courses': ['Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Southern Chef Academy',
        'courses': ['International Cuisine Course', 'Professional Culinary Arts']
      },
      {
        'name': 'Tenkasi Culinary Institute',
        'courses': ['Vegetarian Culinary Course', 'Professional Culinary Arts']
      },
    ],
    'Kanyakumari': [
      {
        'name': 'Kanyakumari Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Cape Pastry School',
        'courses': ['Diploma in Baking & Pastry Arts', 'International Cuisine Course']
      },
      {
        'name': 'South Shore Chef Academy',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Nagercoil Culinary Centre',
        'courses': ['Diploma in Baking & Pastry Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Lakeview Culinary School',
        'courses': ['International Cuisine Course', 'Professional Culinary Arts']
      },
      {
        'name': 'Fishermen\'s Culinary Institute',
        'courses': ['Vegetarian Culinary Course', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Anna Maria Pastry School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
      {
        'name': 'Vattakottai Culinary Centre',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'Southern Coast Pastry Academy',
        'courses': ['Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Kanya Chef Institute',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
    ],
    'Vellore': [
      {
        'name': 'Vellore Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Christian Culinary College, Vellore',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
      {
        'name': 'Vellore Pastry Academy',
        'courses': ['Diploma in Baking & Pastry Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Golden Valley Chef School',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'St. John Culinary Centre',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Crescent Culinary Academy',
        'courses': ['Vegetarian Culinary Course', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'North Vellore Pastry School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
      {
        'name': 'Vellore City Chef Institute',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'SciTech Culinary School',
        'courses': ['Advanced Culinary Techniques', 'Professional Culinary Arts']
      },
      {
        'name': 'Heritage Culinary Academy, Vellore',
        'courses': ['Professional Culinary Arts', 'Vegetarian Culinary Course']
      },
    ],
    'Thanjavur': [
      {
        'name': 'Thanjavur Culinary Institute',
        'courses': ['Professional Culinary Arts', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Brihadeeswarar Pastry School',
        'courses': ['Diploma in Baking & Pastry Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Kaveri Culinary Academy',
        'courses': ['International Cuisine Course', 'Professional Culinary Arts']
      },
      {
        'name': 'Royal Pastry Institute',
        'courses': ['Diploma in Baking & Pastry Arts', 'Vegetarian Culinary Course']
      },
      {
        'name': 'Saraswathi Culinary School',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Palanisamy Chef Academy',
        'courses': ['Professional Culinary Arts', 'International Cuisine Course']
      },
      {
        'name': 'Grand Palace Pastry & Culinary',
        'courses': ['Diploma in Baking & Pastry Arts', 'Professional Culinary Arts']
      },
      {
        'name': 'Thanjavur Vocational Culinary Centre',
        'courses': ['Vegetarian Culinary Course', 'Diploma in Baking & Pastry Arts']
      },
      {
        'name': 'Heritage Chef Institute',
        'courses': ['Professional Culinary Arts', 'Advanced Culinary Techniques']
      },
      {
        'name': 'Royal Heritage Culinary School',
        'courses': ['International Cuisine Course', 'Diploma in Baking & Pastry Arts']
      },
    ],
  };

  CulinaryArtsCollegesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final districts = tamilNaduCulinaryColleges.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Culinary Arts Colleges (Tamil Nadu)'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: districts.length,
        itemBuilder: (context, index) {
          final district = districts[index];
          final colleges = tamilNaduCulinaryColleges[district] ?? [];

          return Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ExpansionTile(
              title: Text(
                district,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: colleges.map((college) {
                final collegeName = college['name'] as String;
                final courses = List<String>.from(college['courses'] ?? []);
                return ListTile(
                  title: Text(collegeName),
                  subtitle: Text(courses.join(', ')),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text(collegeName),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Courses available:'),
                                SizedBox(height: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: courses.map((c) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 6),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('• '),
                                          Expanded(child: Text(c)),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 12),
                                Text('Note: This is sample data. Replace with verified details when ready.')
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
