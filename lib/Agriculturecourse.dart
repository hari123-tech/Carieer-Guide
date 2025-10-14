// lib/pages/agriculture_courses_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import your colleges page. Update the path if the file is located elsewhere.
import 'Agriculturecollege.dart';

class AgricultureCoursesPage extends StatefulWidget {
  AgricultureCoursesPage({Key? key}) : super(key: key);

  @override
  _AgricultureCoursesPageState createState() => _AgricultureCoursesPageState();
}

class _AgricultureCoursesPageState extends State<AgricultureCoursesPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> agricultureCourses = [
    {
      'title': 'B.Sc. Agriculture',
      'description': 'Covers soil science, crop production, pest control, and agronomy.',
      'duration': '4 years',
      'benefits': 'Opportunities in farming, research, and agri-business.',
      'govt_jobs': [
        'Agricultural Officer (State/central schemes)',
        'Agronomist in government research institutes',
        'Extension Officer (state agricultural departments)',
        'Soil Conservation Officer'
      ],
      'private_jobs': [
        'Agri-business Manager',
        'Farm Manager / Agronomist',
        'Agri-input sales & marketing',
        'Research associate in private agritech companies'
      ]
    },
    {
      'title': 'B.Sc. Horticulture',
      'description': 'Focuses on fruits, vegetables, flower farming, and garden management.',
      'duration': '4 years',
      'benefits': 'Jobs in floriculture, nursery management, and research.',
      'govt_jobs': [
        'Horticulture Officer (government nurseries)',
        'Research positions in government horticulture institutes'
      ],
      'private_jobs': [
        'Nursery Manager',
        'Landscape Designer',
        'Greenhouse Manager',
        'Quality control in seed/plant production companies'
      ]
    },
    {
      'title': 'B.Sc. Forestry',
      'description': 'Studies forest management, wildlife, biodiversity, and ecology.',
      'duration': '4 years',
      'benefits': 'Careers in forest departments, NGOs, and environmental research.',
      'govt_jobs': [
        'Forest Range Officer (after relevant exams/training)',
        'Wildlife Warden (with additional qualifications)',
        'Forest Research positions'
      ],
      'private_jobs': [
        'Environmental Consultant',
        'Conservation project manager (NGOs/private consultancies)',
        'Ecotourism manager'
      ]
    },
    {
      'title': 'M.Sc. Agriculture',
      'description': 'Advanced training in genetics, breeding, agribusiness, and plant pathology.',
      'duration': '2 years',
      'benefits': 'Higher research and academic positions in agriculture.',
      'govt_jobs': [
        'Senior Research Scientist (ICAR/state research centers)',
        'Lecturer in agricultural colleges (government posts)'
      ],
      'private_jobs': [
        'R&D Scientist in agritech / seed companies',
        'Senior agronomist / consultant',
        'Product development for agrochemical companies'
      ]
    },
    {
      'title': 'Diploma in Agricultural Engineering',
      'description': 'Includes farm machinery, irrigation techniques, and rural construction.',
      'duration': '3 years',
      'benefits': 'Technical roles in agriculture companies and irrigation boards.',
      'govt_jobs': [
        'Technician/Engineer (irrigation departments, public works)',
        'Maintenance engineer in government agricultural projects'
      ],
      'private_jobs': [
        'Field service engineer for farm machinery companies',
        'Irrigation systems designer in private firms'
      ]
    },
    {
      'title': 'B.Sc. Agronomy',
      'description': 'Specializes in crop science, sustainable farming, and soil management.',
      'duration': '4 years',
      'benefits': 'Work as an agronomist or in sustainable agriculture.',
      'govt_jobs': [
        'Agronomy specialist in government schemes',
        'Extension specialist'
      ],
      'private_jobs': [
        'Crop consultant',
        'Agri-input technical sales',
        'Research associate in seed companies'
      ]
    },
    {
      'title': 'M.Sc. Soil Science',
      'description': 'Focuses on soil fertility, soil chemistry, and land-use practices.',
      'duration': '2 years',
      'benefits': 'Research roles in soil conservation and land management.',
      'govt_jobs': [
        'Soil Scientist in government research institutes',
        'Soil testing lab officer (government labs)'
      ],
      'private_jobs': [
        'Soil testing & consultancy services',
        'Research roles in agribusiness firms'
      ]
    },
    {
      'title': 'B.Tech in Agricultural Engineering',
      'description': 'Covers technology in agriculture, farm automation, and food processing.',
      'duration': '4 years',
      'benefits': 'Engineering roles in agri-tech companies.',
      'govt_jobs': [
        'Engineering roles in public sector agricultural undertakings',
        'Technical posts in government agricultural projects'
      ],
      'private_jobs': [
        'Design engineer for agricultural machinery',
        'Automation engineer in agritech firms',
        'Process engineer in food processing industry'
      ]
    },
    {
      'title': 'M.Sc. Plant Pathology',
      'description': 'Deals with crop diseases, fungi, viruses, and plant defense.',
      'duration': '2 years',
      'benefits': 'Research in disease control and plant biotechnology.',
      'govt_jobs': [
        'Plant pathologist in government research centers',
        'Positions in government disease surveillance programs'
      ],
      'private_jobs': [
        'Research scientist in agrochemical/seed companies',
        'Diagnostic lab specialist'
      ]
    },
    {
      'title': 'Ph.D. in Agriculture',
      'description': 'Research-based degree in plant science, biotechnology, or agri-economics.',
      'duration': '3–5 years',
      'benefits': 'Academic, research, and policy-making roles.',
      'govt_jobs': [
        'Senior scientist / research group leader in national institutes',
        'Policy analyst in government agricultural departments'
      ],
      'private_jobs': [
        'R&D head in corporate agritech',
        'Consultant for international/agri NGOs'
      ]
    },
    {
      'title': 'Certificate in Organic Farming',
      'description': 'Short course focused on organic practices and sustainable farming.',
      'duration': '6 months',
      'benefits': 'Grow organic crops and start eco-friendly farms.',
      'govt_jobs': [
        'Advisor in government organic farming schemes',
        'Extension role in state agriculture departments'
      ],
      'private_jobs': [
        'Organic farm entrepreneur',
        'Consultant for certification and organic supply chains'
      ]
    },
  ];

  List<Map<String, dynamic>> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = agricultureCourses;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCourses = agricultureCourses.where((course) {
        final title = (course['title'] ?? '').toString().toLowerCase();
        final description = (course['description'] ?? '').toString().toLowerCase();
        return title.contains(query) || description.contains(query);
      }).toList();
    });
  }

  Future<void> _saveCourseToFirebase(
      String title,
      String description,
      String duration,
      String benefits,
      List<dynamic> govtJobs,
      List<dynamic> privateJobs) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('selectedCourses')
          .add({
        'category': 'Agriculture',
        'course': title,
        'description': description,
        'duration': duration,
        'benefits': benefits,
        'govt_jobs': govtJobs,
        'private_jobs': privateJobs,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please sign in to save courses')),
      );
    }
  }

  Widget _buildJobsList(List<dynamic> jobs) {
    if (jobs.isEmpty) {
      return const Text('No job data available');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: jobs.map<Widget>((job) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(fontSize: 14)),
              Expanded(child: Text(job.toString(), style: const TextStyle(fontSize: 14))),
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
        title: const Text('Agriculture Courses'),
        backgroundColor: Colors.green,
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to the Agriculture Colleges page.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AgricultureCollegesTNPage(
                    // optional: pass an initial district to auto-expand
                    initialDistrict: 'Coimbatore',
                  ),
                ),
              );
            },
            child: const Text(
              'Colleges',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(course['title'] ?? '',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          trailing: IconButton(
                            icon: const Icon(Icons.bookmark_add_outlined),
                            onPressed: () async {
                              await _saveCourseToFirebase(
                                course['title'] ?? '',
                                course['description'] ?? '',
                                course['duration'] ?? '',
                                course['benefits'] ?? '',
                                govtJobs,
                                privateJobs,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Saved: ${course['title']}')),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(course['description'] ?? ''),
                        const SizedBox(height: 6),
                        Text("⏳ Duration: ${course['duration'] ?? ''}"),
                        const SizedBox(height: 6),
                        Text("🎯 Benefits: ${course['benefits'] ?? ''}"),
                        const SizedBox(height: 8),
                        const Text("🏛 Government Jobs:", style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        _buildJobsList(govtJobs),
                        const SizedBox(height: 8),
                        const Text("🏢 Private Jobs:", style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        _buildJobsList(privateJobs),
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


