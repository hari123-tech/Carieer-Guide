import 'package:flutter/material.dart';

class EventManagementcourse extends StatelessWidget {
  final String category;

  EventManagementcourse({Key? key, this.category = 'Event Management'})
      : super(key: key);

  final List<Map<String, dynamic>> courses = [
    {
      'name': 'Diploma in Event Management',
      'duration': '1 Year',
      'description':
          'Covers event planning, budgeting, logistics, and vendor management.',
      'governmentJobs': [
        'Event Coordinator (Govt Events)',
        'Cultural Program Organizer'
      ],
      'privateJobs': ['Event Coordinator', 'Operations Assistant']
    },
    {
      'name': 'Bachelor of Business Administration (Event Management)',
      'duration': '3 Years',
      'description': 'Combines business with event planning and marketing.',
      'governmentJobs': [
        'Program Manager (Tourism Dept)',
      ],
      'privateJobs': ['Event Manager', 'Sponsorship Manager']
    },
    {
      'name': 'Certificate in Wedding Planning',
      'duration': '3 Months',
      'description': 'Focus on planning, vendors, and client handling.',
      'governmentJobs': ['Support Roles in Tourism/Culture'],
      'privateJobs': ['Wedding Planner', 'Venue Coordinator']
    },
    {
      'name': 'PG Diploma in Event Management',
      'duration': '1 Year',
      'description':
          'Advanced planning, risk handling, sponsorship and leadership.',
      'governmentJobs': ['Senior Event Officer (Tourism/Cultural Dept)'],
      'privateJobs': ['Senior Producer', 'Corporate Events Lead']
    }
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
                MaterialPageRoute(
                    builder: (_) => EventManagementCollegesPage()),
              );
            },
            child: Text('Colleges',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          )
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course['name'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Duration: ${course['duration']}',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text(course['description'], style: TextStyle(fontSize: 15)),
                    SizedBox(height: 12),
                    Text('Government Jobs:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ...List<String>.from(course['governmentJobs'])
                        .map((job) => Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text('• $job'),
                            )),
                    SizedBox(height: 12),
                    Text('Private Jobs:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ...List<String>.from(course['privateJobs'])
                        .map((job) => Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text('• $job'),
                            )),
                  ]),
            ),
          );
        },
      ),
    );
  }
}

class EventManagementCollegesPage extends StatelessWidget {
  final List<Map<String, dynamic>> colleges = [
    {
      'name': 'Event Academy Chennai',
      'district': 'Chennai',
      'courses': [
        'Diploma in Event Management',
        'Certificate in Wedding Planning'
      ]
    },
    {
      'name': 'Trichy Institute of Event Planning',
      'district': 'Trichy',
      'courses': ['PG Diploma in Event Management']
    },
    {
      'name': 'Madurai Event School',
      'district': 'Madurai',
      'courses': ['BBA (Event Management)', 'Diploma in Event Management']
    },
    {
      'name': 'Coimbatore School of Events',
      'district': 'Coimbatore',
      'courses': ['Diploma in Event Management', 'Wedding Planning']
    },
    {
      'name': 'Tirunelveli Event College',
      'district': 'Tirunelveli',
      'courses': ['Diploma in Event Management']
    },
    {
      'name': 'Salem Institute of Events',
      'district': 'Salem',
      'courses': ['BBA Event Management']
    },
    {
      'name': 'Kanyakumari School of Event Arts',
      'district': 'Kanyakumari',
      'courses': ['Certificate in Wedding Planning']
    },
    {
      'name': 'Thanjavur Event Training Center',
      'district': 'Thanjavur',
      'courses': ['PG Diploma in Event Management']
    },
    {
      'name': 'Erode College of Events',
      'district': 'Erode',
      'courses': ['Diploma in Event Management']
    },
    {
      'name': 'Vellore Events Academy',
      'district': 'Vellore',
      'courses': ['BBA Event Management']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Management Colleges'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: colleges.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> c = colleges[index];
          final List<String> courseList = List<String>.from(c['courses']);
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(c['name'] ?? ''),
              subtitle: Text('${c['district']} • ${courseList.join(', ')}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CollegeDetailsPage(college: c)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CollegeDetailsPage extends StatelessWidget {
  final Map<String, dynamic> college;
  CollegeDetailsPage({required this.college});

  @override
  Widget build(BuildContext context) {
    final courses = List<String>.from(college['courses'] ?? []);
    return Scaffold(
      appBar: AppBar(
          title: Text(college['name'] ?? ''), backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(college['name'] ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('District: ${college['district']}'),
          SizedBox(height: 12),
          Text('Courses:', style: TextStyle(fontWeight: FontWeight.bold)),
          ...courses.map((c) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text('• $c'),
              )),
        ]),
      ),
    );
  }
}
