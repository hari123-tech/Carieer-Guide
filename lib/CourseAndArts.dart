import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ArtsCollegesPage.dart';

class CourseAndArts extends StatefulWidget {
  final String category;
  const CourseAndArts({super.key, required this.category});

  @override
  State<CourseAndArts> createState() => _CourseAndArtsState();
}

class _CourseAndArtsState extends State<CourseAndArts> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredCourses = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Use Map<String, dynamic> so we can include lists for jobs
  final List<Map<String, dynamic>> artsCourses = [
    {
      'title': 'B.A. (Bachelor of Arts)',
      'duration': '3 years',
      'benefits': 'Ideal for careers in teaching, civil services, and social sciences.',
      'govt_jobs': [
        'Civil Services (UPSC/TNPSC)',
        'School/College Lecturer (State Government)',
        'Public Sector Research Assistant',
        'Government Cultural Departments'
      ],
      'private_jobs': [
        'Content Writer / Editor',
        'PR & Communications Executive',
        'NGO Program Coordinator',
        'Corporate Training Executive'
      ],
    },
    {
      'title': 'BFA (Bachelor of Fine Arts)',
      'duration': '3-4 years',
      'benefits': 'Great for careers in painting, sculpture, theatre, and music.',
      'govt_jobs': [
        'Artist in Government Art Academies',
        'Museum/Gallery Curator (Government)',
        'Cultural Officer'
      ],
      'private_jobs': [
        'Freelance Artist / Illustrator',
        'Designer (Theatre/Film/Events)',
        'Art Instructor / Private Studio'
      ],
    },
    {
      'title': 'B.Des (Bachelor of Design)',
      'duration': '4 years',
      'benefits': 'Careers in graphic, fashion, interior, or industrial design.',
      'govt_jobs': [
        'Design Consultant for Government Projects',
        'Government Design Institutes (teaching/technical roles)'
      ],
      'private_jobs': [
        'Graphic / UI Designer',
        'Product / Industrial Designer',
        'Fashion Designer',
        'Interior Designer'
      ],
    },
    {
      'title': 'BMM (Bachelor of Mass Media)',
      'duration': '3 years',
      'benefits': 'Opens careers in journalism, PR, advertising, and broadcasting.',
      'govt_jobs': [
        'Public Relations Officer (Government Departments)',
        'Broadcasting Officer in Government Media',
        'Information Officer'
      ],
      'private_jobs': [
        'Journalist / Reporter',
        'Content Producer',
        'PR & Brand Executive',
        'Advertising Account Manager'
      ],
    },
    {
      'title': 'BJMC (Journalism & Mass Communication)',
      'duration': '3 years',
      'benefits': 'Careers in media, reporting, and content creation.',
      'govt_jobs': [
        'Working with Government Media Units',
        'Press Information Bureau Assistant',
        'Public Relations in Government Organizations'
      ],
      'private_jobs': [
        'News Anchor / Reporter',
        'Digital Content Strategist',
        'Copywriter',
        'Media Planner'
      ],
    },
    {
      'title': 'BA in History',
      'duration': '3 years',
      'benefits': 'Work in research, museums, archaeology, and academia.',
      'govt_jobs': [
        'Archaeological Survey of India / State Archaeology Dept',
        'Museum Curator (Government)',
        'Research Assistant in Government Institutes'
      ],
      'private_jobs': [
        'Heritage Consultant',
        'Researcher for NGOs / Think Tanks',
        'Content writer for history media'
      ],
    },
    {
      'title': 'BA in Psychology',
      'duration': '3 years',
      'benefits': 'Path to counseling, therapy, HR, and mental health roles.',
      'govt_jobs': [
        'Counselor in Government Schools / Colleges',
        'Psychological Assistant in Public Hospitals'
      ],
      'private_jobs': [
        'Clinical / Counseling Psychologist (with further study)',
        'HR Executive',
        'Corporate Wellness Specialist'
      ],
    },
    {
      'title': 'BA in Sociology',
      'duration': '3 years',
      'benefits': 'Useful for social work, NGOs, and policy research.',
      'govt_jobs': [
        'Social Welfare Department Roles',
        'Policy Research roles in government bodies'
      ],
      'private_jobs': [
        'NGO Program Manager',
        'Field Researcher',
        'Corporate CSR Executive'
      ],
    },
    {
      'title': 'BA in Political Science',
      'duration': '3 years',
      'benefits': 'Great for UPSC, public policy, diplomacy, and law.',
      'govt_jobs': [
        'Administrative / Civil Services',
        'Diplomatic Services (with further qualifications)'
      ],
      'private_jobs': [
        'Policy Analyst',
        'Political Researcher',
        'Lobbying / Advocacy roles in NGOs'
      ],
    },
    {
      'title': 'BA in Philosophy',
      'duration': '3 years',
      'benefits': 'Sharpens reasoning for law, teaching, and ethics roles.',
      'govt_jobs': [
        'Teaching in Government Colleges (after qualifying exams)',
        'Research roles in government ethics committees'
      ],
      'private_jobs': [
        'Law (after further study)',
        'Ethics Consultant',
        'Academia / Teaching'
      ],
    },
    {
      'title': 'BA in Literature',
      'duration': '3 years',
      'benefits': 'Leads to careers in writing, editing, and teaching.',
      'govt_jobs': [
        'School / College Lecturer (Government)',
        'Positions in Cultural / Literary Departments'
      ],
      'private_jobs': [
        'Editor / Publisher',
        'Content Writer',
        'Translator'
      ],
    },
    {
      'title': 'BA in Liberal Arts',
      'duration': '3 years',
      'benefits': 'Flexible careers in creativity and communication.',
      'govt_jobs': [
        'Public Sector roles suitable for generalists',
        'Teaching and administrative roles'
      ],
      'private_jobs': [
        'Startup roles',
        'Content & Research roles',
        'Consultancy'
      ],
    },
    {
      'title': 'BA in Performing Arts',
      'duration': '3 years',
      'benefits': 'Focuses on music, dance, choreography, and theatre.',
      'govt_jobs': [
        'Artist / Performer in Government Cultural Troupes',
        'Jobs in government-sponsored cultural institutions'
      ],
      'private_jobs': [
        'Performer / Choreographer',
        'Music Teacher / Theatre Director',
        'Event Performer'
      ],
    },
    {
      'title': 'BA in Foreign Languages',
      'duration': '3 years',
      'benefits': 'Jobs in translation, tourism, and foreign affairs.',
      'govt_jobs': [
        'Translation & Interpreter roles in government departments',
        'Positions in consulates and foreign affairs units'
      ],
      'private_jobs': [
        'Translator / Interpreter',
        'Tourism & Hospitality roles',
        'Localization Specialist'
      ],
    },
    {
      'title': 'BA in Education',
      'duration': '3 years',
      'benefits': 'For aspiring teachers and educational leaders.',
      'govt_jobs': [
        'Government School Teacher (after B.Ed & qualifying exams)',
        'Education Department roles'
      ],
      'private_jobs': [
        'Private School Teacher',
        'Educational Content Developer',
        'EdTech Roles'
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    filteredCourses = artsCourses;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCourses = artsCourses.where((course) {
        final title = (course['title'] ?? '').toString().toLowerCase();
        final benefits = (course['benefits'] ?? '').toString().toLowerCase();
        return title.contains(query) || benefits.contains(query);
      }).toList();
    });
  }

  Future<void> _saveCourseToFirebase(
      String title, String duration, String benefits, List<dynamic> govtJobs, List<dynamic> privateJobs) async {
    final user = _auth.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please login to save courses')),
      );
      return;
    }

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('selectedCourses')
          .add({
        'category': widget.category,
        'course': title,
        'duration': duration,
        'benefits': benefits,
        'govt_jobs': govtJobs,
        'private_jobs': privateJobs,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved: $title')),
      );
    } catch (e) {
      debugPrint("Error saving course: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save course')),
      );
    }
  }

  Widget _buildJobsSection(String heading, List<dynamic> jobs) {
    if (jobs.isEmpty) {
      return Text('No data available');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: jobs.map<Widget>((j) {
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

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Colors.deepPurple,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CollegesInTamilNaduPage(),
                ),
              );
            },
            child: const Text(
              'Colleges',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                final course = filteredCourses[index];
                final govtJobs = List<dynamic>.from(course['govt_jobs'] ?? []);
                final privateJobs = List<dynamic>.from(course['private_jobs'] ?? []);

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.menu_book_outlined),
                          title: Text(
                            course['title'] ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.bookmark_add_outlined),
                            onPressed: () {
                              _saveCourseToFirebase(
                                course['title'] ?? '',
                                course['duration'] ?? '',
                                course['benefits'] ?? '',
                                govtJobs,
                                privateJobs,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 6.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("⏳ Duration: ${course['duration'] ?? ''}"),
                              const SizedBox(height: 6),
                              Text("🎯 Benefits: ${course['benefits'] ?? ''}"),
                              const SizedBox(height: 8),
                              const Text("🏛️ Government Jobs:", style: TextStyle(fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              _buildJobsSection("Government", govtJobs),
                              const SizedBox(height: 8),
                              const Text("🏢 Private Jobs:", style: TextStyle(fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              _buildJobsSection("Private", privateJobs),
                            ],
                          ),
                        ),
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
