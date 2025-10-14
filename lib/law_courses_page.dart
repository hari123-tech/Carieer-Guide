import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Make sure this path matches where you keep the LawCollegePage file.
import 'LawColleges.dart';

class LawCoursesPage extends StatefulWidget {
  @override
  _LawCoursesPageState createState() => _LawCoursesPageState();
}

class _LawCoursesPageState extends State<LawCoursesPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> allCourses = [
    {
      'title': 'Criminal Law',
      'duration': '3 Years',
      'benefits': 'Understand legal systems and criminal justice.',
      'govt_jobs': [
        'Public Prosecutor (in some jurisdictions after further qualification)',
        'Legal Officer – Police Department',
        'Judicial Services (after clearing judicial exams)',
        'State Forensic Department (legal advisor roles)'
      ],
      'private_jobs': [
        'Criminal Defense Lawyer',
        'Legal Consultant for NGOs',
        'Research Associate in law firms',
        'Compliance & Risk Analyst'
      ]
    },
    {
      'title': 'Civil Law',
      'duration': '3 Years',
      'benefits': 'Handle disputes between individuals and organizations.',
      'govt_jobs': [
        'Judicial Services (Civil Judge after exams)',
        'Legal Officer in Municipal or State Departments',
        'Legal Aid Services (government-supported)'
      ],
      'private_jobs': [
        'Litigation Lawyer (Civil suits)',
        'Corporate Legal Counsel',
        'Arbitration / Dispute Resolution Specialist'
      ]
    },
    {
      'title': 'Constitutional Law',
      'duration': '2 Years',
      'benefits': 'Gain knowledge of governance and law structure.',
      'govt_jobs': [
        'Researcher/Advisor in Government Legal Departments',
        'Constitutional Law Advisor in public commissions'
      ],
      'private_jobs': [
        'Policy Analyst in think-tanks',
        'Legal Researcher in law firms or NGOs',
        'Consultant for public policy projects'
      ]
    },
    {
      'title': 'Corporate Law',
      'duration': '2 Years',
      'benefits': 'Deal with legal aspects of businesses.',
      'govt_jobs': [
        'Company Law Board / Registrar roles (where applicable)',
        'Legal positions in public sector undertakings'
      ],
      'private_jobs': [
        'Corporate Lawyer / In-house Counsel',
        'Mergers & Acquisitions Advisor',
        'Compliance Officer',
        'Contract Manager'
      ]
    },
    {
      'title': 'Family Law',
      'duration': '2 Years',
      'benefits': 'Manage cases on marriage, divorce, custody.',
      'govt_jobs': [
        'Family Court Legal Assistant (government-run courts)',
        'Legal aid officer in government welfare departments'
      ],
      'private_jobs': [
        'Family Law Practitioner',
        'Mediation Counsel',
        'Counselor for NGOs working on family issues'
      ]
    },
    {
      'title': 'International Law',
      'duration': '2 Years',
      'benefits': 'Work with treaties, foreign policies, and global rules.',
      'govt_jobs': [
        'Positions in Foreign/External Affairs departments',
        'Legal Officer in international agencies (government nominations)'
      ],
      'private_jobs': [
        'Legal Advisor for multinational firms',
        'International Arbitration Counsel',
        'Consultant for NGOs working on cross-border issues'
      ]
    },
    {
      'title': 'Intellectual Property Law',
      'duration': '1 Year',
      'benefits': 'Protect inventions, trademarks, and copyrights.',
      'govt_jobs': [
        'Patent Examiner / Trademark Officer (IP Office)',
        'IP Policy roles in government bodies'
      ],
      'private_jobs': [
        'Patent Attorney / Trademark Lawyer',
        'IP Consultant for startups and corporations',
        'Technology Transfer Officer'
      ]
    },
    {
      'title': 'Environmental Law',
      'duration': '1 Year',
      'benefits': 'Address climate and ecological legal issues.',
      'govt_jobs': [
        'Legal Officer in Environment Ministry/State Dept',
        'Regulatory Compliance roles in public bodies'
      ],
      'private_jobs': [
        'Environmental Compliance Lawyer',
        'Advisor for NGOs and consultancies',
        'Corporate Sustainability Legal Advisor'
      ]
    },
    {
      'title': 'Human Rights Law',
      'duration': '2 Years',
      'benefits': 'Advocate for individual and group freedoms.',
      'govt_jobs': [
        'Positions in Human Rights Commissions (state/national)',
        'Legal Officer in government welfare departments'
      ],
      'private_jobs': [
        'Human Rights Advocate in NGOs',
        'Policy Researcher',
        'Legal Advisor for international organizations'
      ]
    },
  ];

  List<Map<String, dynamic>> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = allCourses;
    _searchController.addListener(_filterCourses);
  }

  void _filterCourses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCourses = allCourses.where((course) {
        final title = (course['title'] ?? '').toString().toLowerCase();
        final benefits = (course['benefits'] ?? '').toString().toLowerCase();
        return title.contains(query) || benefits.contains(query);
      }).toList();
    });
  }

  Future<void> _saveCourseToFirebase(Map<String, dynamic> course) async {
    final user = _auth.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please sign in to save courses')),
      );
      return;
    }

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('selectedCourses')
          .add({
        'title': course['title'],
        'duration': course['duration'],
        'benefits': course['benefits'],
        'category': 'Law',
        'govt_jobs': course['govt_jobs'] ?? [],
        'private_jobs': course['private_jobs'] ?? [],
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${course['title']} saved!")),
      );
    } catch (e) {
      debugPrint("Error saving course: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save ${course['title']}")),
      );
    }
  }

  Widget _buildJobsList(List<dynamic> jobs) {
    if (jobs.isEmpty) {
      return Text('No job data available');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: jobs.map<Widget>((job) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ', style: TextStyle(fontSize: 14)),
              Expanded(child: Text(job.toString(), style: TextStyle(fontSize: 14))),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCourses);
    _searchController.dispose();
    super.dispose();
  }

  void _openLawCollegesPage({String? courseName}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LawCollegePage(
          courseName: courseName, // LawCollegePage can read this and show title / filter
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Law Courses"),
        backgroundColor: Colors.red.shade700,
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to the LawCollegePage (no filter)
              _openLawCollegesPage();
            },
            child: Text(
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
                labelText: 'Search Courses...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
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
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            course['title'] ?? '',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.bookmark_add_outlined),
                            onPressed: () => _saveCourseToFirebase(course),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("Duration: ${course['duration'] ?? ''}"),
                        SizedBox(height: 4),
                        Text("Benefits: ${course['benefits'] ?? ''}"),
                        SizedBox(height: 8),
                        Text("Government Jobs:", style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        _buildJobsList(govtJobs),
                        SizedBox(height: 8),
                        Text("Private Jobs:", style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        _buildJobsList(privateJobs),
                        const SizedBox(height: 8),
                        // New row with View Colleges button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                // Open colleges page and pass this course's title so the colleges page can react if needed
                                _openLawCollegesPage(courseName: course['title']?.toString());
                              },
                              icon: Icon(Icons.account_balance),
                              label: Text('View Colleges'),
                            ),
                          ],
                        )
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
