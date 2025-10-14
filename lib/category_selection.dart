import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Update these imports to the correct paths in your project:
import 'CourseAndEngineering.dart';
import 'medicalcourse.dart';
import 'CourseAndArts.dart';
import 'law_courses_page.dart';
import 'AgricultureCourse.dart';
import 'OtherSpecializedFieldsPage.dart';
import 'BusinessCourse.dart';

class CategorySelectionPage extends StatelessWidget {
  CategorySelectionPage({Key? key}) : super(key: key);

  final List<String> categories = [
    'Engineering & Technology',
    'Medical / Health Sciences',
    'Arts & Humanities',
    'Business and Management',
    'Law',
    'Agriculture',
    'Other Specialized Fields',
    'Event Management',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Study Category'),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final selectedCategory = categories[index];

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  selectedCategory,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                // ✅ Changed arrow icon to a more visible one
                trailing: Icon(
                  Icons.chevron_right, // or use Icons.arrow_right_alt
                  color: Colors.grey[700],
                ),
                onTap: () => _handleCategoryTap(context, selectedCategory),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _handleCategoryTap(
      BuildContext context, String selectedCategory) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not signed in')),
      );
      return;
    }

    try {
      // Save selected category in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({'selectedCategory': selectedCategory}, SetOptions(merge: true));

      // Choose next page
      Widget nextPage;

      switch (selectedCategory) {
        case 'Engineering & Technology':
          nextPage = CourseAndEngineering();
          break;
        case 'Medical / Health Sciences':
          nextPage = CourseAndMedical(category: selectedCategory);
          break;
        case 'Arts & Humanities':
          nextPage = CourseAndArts(category: selectedCategory);
          break;
        case 'Business and Management':
          nextPage = BusinessManagementCoursesPage();
          break;
        case 'Law':
          nextPage = LawCoursesPage();
          break;
        case 'Agriculture':
          nextPage = AgricultureCoursesPage();
          break;
        case 'Other Specialized Fields':
          nextPage = OtherSpecializedFieldsPage(category: selectedCategory);
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Page not found for this category')),
          );
          return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => nextPage),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }
}
