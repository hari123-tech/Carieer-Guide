import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'FashionDesigningPage.dart'; // ✅ Import FashionDesigningPage
import 'HotelManagementPage.dart'; // ✅ Import HotelManagementPage
import 'CulinaryArtsPage.dart'; // ✅ Import CulinaryArtsPage
import 'EventManagementcourse.dart'; // ✅ Import EventManagementcourse
import 'Animation&MultimediaCourse.dart'; // ✅ Import your new page

class OtherSpecializedFieldsPage extends StatelessWidget {
  final String category;

  OtherSpecializedFieldsPage({required this.category});

  final List<String> defaultCourses = [
    'Fashion Designing',
    'Hotel Management',
    'Culinary Arts',
    'Event Management',
    'Animation & Multimedia',
    'Travel & Tourism',
    'Interior Design',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('courseCategories')
            .doc('OtherSpecializedFields')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading courses'));
          }

          List<String> courses = [];

          if (snapshot.hasData && snapshot.data!.exists) {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            final courseList = data['courses'];

            if (courseList is List) {
              courses = List<String>.from(courseList);
            }
          }

          // Fallback if Firestore is empty
          if (courses.isEmpty) {
            courses = defaultCourses;
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final selectedCourse = courses[index];

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    selectedCourse,
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    if (selectedCourse == 'Fashion Designing') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              FashionDesigningPage(category: selectedCourse),
                        ),
                      );
                    } else if (selectedCourse == 'Hotel Management') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              HotelManagementPage(category: selectedCourse),
                        ),
                      );
                    } else if (selectedCourse == 'Culinary Arts') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CulinaryArtsPage(category: selectedCourse),
                        ),
                      );
                    } else if (selectedCourse == 'Event Management') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EventManagementcourse(category: selectedCourse),
                        ),
                      );
                    } else if (selectedCourse == 'Animation & Multimedia') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AnimationMultimediaCourse(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selected: $selectedCourse')),
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
