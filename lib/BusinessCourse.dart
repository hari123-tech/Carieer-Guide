import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Make sure this file exists in your project and the class is named BusinessCollegePage
import 'BusinessColleges.dart';

class BusinessManagementCoursesPage extends StatefulWidget {
  const BusinessManagementCoursesPage({Key? key}) : super(key: key);

  @override
  _BusinessManagementCoursesPageState createState() =>
      _BusinessManagementCoursesPageState();
}

class _BusinessManagementCoursesPageState
    extends State<BusinessManagementCoursesPage> {
  final TextEditingController _searchController = TextEditingController();

  // Sample courses
  final List<Map<String, dynamic>> _courses = [
    {
      'title': 'BBA - Bachelor of Business Administration',
      'duration': '3 Years',
      'benefits':
          'Covers fundamentals of business, management, marketing and finance.',
      'govt_jobs': [
        'Administrative Officer (public sector)',
        'Probationary Officer (Bank PO exams)',
        'Clerical roles in government departments (after exams)'
      ],
      'private_jobs': [
        'Management Trainee',
        'Business Analyst',
        'Sales & Marketing Executive',
        'HR Executive'
      ]
    },
    {
      'title': 'B.Com - Bachelor of Commerce',
      'duration': '3 Years',
      'benefits': 'Strong grounding in accounting, finance and taxation.',
      'govt_jobs': [
        'Tax Assistant (Income Tax Department)',
        'Audit Assistant (Government audit offices)',
        'Clerical roles in public sector banks'
      ],
      'private_jobs': [
        'Accountant',
        'Financial Analyst',
        'Tax Consultant',
        'Audit Associate'
      ]
    },
    {
      'title': 'MBA - Master of Business Administration',
      'duration': '2 Years',
      'benefits':
          'Advanced management training, leadership roles, specialization options.',
      'govt_jobs': [
        'Manager/Officer in PSUs (through exams/interviews)',
        'Policy analyst (government departments)',
      ],
      'private_jobs': [
        'Product Manager',
        'Management Consultant',
        'Finance Manager',
        'Marketing Manager'
      ]
    },
    // Add more courses as needed...
  ];

  List<Map<String, dynamic>> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = _courses;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final q = _searchController.text.toLowerCase();
    setState(() {
      _filtered = _courses.where((c) {
        final title = (c['title'] ?? '').toString().toLowerCase();
        final benefits = (c['benefits'] ?? '').toString().toLowerCase();
        return title.contains(q) || benefits.contains(q);
      }).toList();
    });
  }

  Future<void> _saveCourse(Map<String, dynamic> course) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please sign in to save courses')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('selectedCourses')
          .add({
        'category': 'Business & Management',
        'title': course['title'],
        'duration': course['duration'],
        'benefits': course['benefits'],
        'govt_jobs': course['govt_jobs'] ?? [],
        'private_jobs': course['private_jobs'] ?? [],
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved: ${course['title']}')),
      );
    } catch (e) {
      debugPrint('Error saving course: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save course')),
      );
    }
  }

  Widget _jobsColumn(List<dynamic>? jobs) {
    final list = (jobs ?? []).cast<dynamic>();
    if (list.isEmpty) return const Text('No job data available');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list.map((j) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(fontSize: 14)),
              Expanded(child: Text(j.toString(), style: const TextStyle(fontSize: 14))),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Open the colleges page. If your BusinessCollegePage accepts a parameter (e.g. courseName),
  // change the constructor call here to pass that value.
  void _openCollegesPage([String? courseName]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BusinessCollegePage(), // or BusinessCollegePage(courseName: courseName)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business & Management Courses'),
        backgroundColor: Colors.redAccent,
        actions: [
          // Colleges button on the right side of the AppBar (navigates to page)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () => _openCollegesPage(),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                backgroundColor: Colors.transparent,
              ),
              child: const Text(
                'Colleges',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: Text('No matching courses found.'))
                : ListView.builder(
                    itemCount: _filtered.length,
                    itemBuilder: (context, idx) {
                      final course = _filtered[idx];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      course['title'] ?? '',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // Per-card "Colleges" button — opens the colleges page (optionally you can pass course title)
                                  TextButton(
                                    onPressed: () => _openCollegesPage(course['title']),
                                    child: const Text('Colleges'),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.bookmark_add_outlined),
                                    onPressed: () => _saveCourse(course),
                                    tooltip: 'Save course',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text('⏳ Duration: ${course['duration'] ?? '-'}'),
                              const SizedBox(height: 6),
                              Text('🎯 Benefits: ${course['benefits'] ?? '-'}'),
                              const SizedBox(height: 8),
                              const Text('🏛 Government Jobs:',
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              _jobsColumn(course['govt_jobs']),
                              const SizedBox(height: 8),
                              const Text('🏢 Private Jobs:',
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              _jobsColumn(course['private_jobs']),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

