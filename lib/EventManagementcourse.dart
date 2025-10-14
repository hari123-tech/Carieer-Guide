import 'package:flutter/material.dart';

class EventManagementcourse extends StatelessWidget {
  final String category;

  EventManagementcourse({Key? key, this.category = 'Event Management'}) : super(key: key);

  final List<Map<String, dynamic>> courses = [
    {
      'name': 'Diploma in Event Management',
      'duration': '1 Year',
      'description':
          'Foundational program covering event planning, logistics, budgeting, vendor management and on-site execution.',
      'governmentJobs': [
        'Event Coordinator (Government Events)',
        'Public Relations Assistant (Municipal Events)',
        'Cultural Program Organizer (State Cultural Dept.)'
      ],
      'privateJobs': [
        'Event Coordinator',
        'Logistics Executive',
        'Operations Assistant'
      ]
    },
    {
      'name': 'Bachelor of Business Administration (Event Management)',
      'duration': '3 Years',
      'description':
          'Degree combining business management with specialized modules in event marketing, sponsorship and production.',
      'governmentJobs': [
        'Program Manager (Public Sector Events)',
        'Tourism Events Officer'
      ],
      'privateJobs': [
        'Event Manager',
        'Sponsorship Manager',
        'Account Manager (Event Agency)'
      ]
    },
    {
      'name': 'Certificate in Wedding Planning',
      'duration': '3 Months',
      'description':
          'Practical course focusing on wedding planning, vendor coordination, rituals & timelines and client handling.',
      'governmentJobs': [
        'Eligible for tourism/cultural support roles; no specific dedicated govt role'
      ],
      'privateJobs': [
        'Wedding Planner',
        'Bride/Groom Coordinator',
        'Venue Coordinator'
      ]
    },
    {
      'name': 'Post Graduate Diploma in Event Management',
      'duration': '1 Year',
      'description':
          'Advanced topics in strategic event planning, risk management, sponsorship negotiation and team leadership.',
      'governmentJobs': [
        'Senior Events Officer (Government Departments)',
        'Training Officer (Govt. Hospitality/Events)'
      ],
      'privateJobs': [
        'Senior Event Producer',
        'Operations Head (Events)',
        'Corporate Events Lead'
      ]
    },
    {
      'name': 'Advanced Diploma in Corporate Events & Conferences',
      'duration': '6 Months',
      'description':
          'Focus on MICE (Meetings, Incentives, Conferences, Exhibitions), conference logistics, and B2B event sales.',
      'governmentJobs': [
        'Conference Coordinator (Government Bodies)',
        'Training & Conference Support Staff'
      ],
      'privateJobs': [
        'Conference Producer',
        'Exhibition Manager',
        'MICE Coordinator'
      ]
    },
    {
      'name': 'Festival and Cultural Event Management',
      'duration': '6 Months',
      'description':
          'Planning and management of large-scale cultural & religious festivals, artist liaison, crowd management and permissions.',
      'governmentJobs': [
        'Festival Coordinator (State Cultural Dept.)',
        'Event Permit Officer (Municipalities)'
      ],
      'privateJobs': [
        'Festival Producer',
        'Artist Liaison Executive',
        'Stage Manager'
      ]
    },
    {
      'name': 'Audio Visual & Stage Management',
      'duration': '4 Months',
      'description':
          'Technical training in stage setup, lighting, sound systems, AV operations and stage cues.',
      'governmentJobs': [
        'Technical Support Staff (Government Auditoriums)',
        'AV Technician (Public Venues)'
      ],
      'privateJobs': [
        'Stage Manager',
        'AV Technician',
        'Lighting Technician',
        'Sound Engineer'
      ]
    },
    {
      'name': 'Sports Event Management',
      'duration': '6 Months',
      'description':
          'Operational planning for sports events, fixtures management, sports marketing, sponsorship and venue logistics.',
      'governmentJobs': [
        'Sports Event Coordinator (State Sports Dept.)',
        'Tournament Officer (Local Sports Boards)'
      ],
      'privateJobs': [
        'Sports Event Organizer',
        'Matchday Operations Manager',
        'Sponsorship Executive'
      ]
    },
    {
      'name': 'Floral Design & Décor for Events',
      'duration': '3 Months',
      'description':
          'Hands-on course in floral design, décor concepts, props and thematic decorations for events and weddings.',
      'governmentJobs': [
        'Eligible for cultural/craft promotion programs; no direct govt post'
      ],
      'privateJobs': [
        'Floral Designer',
        'Décor Designer',
        'Props Coordinator'
      ]
    },
    {
      'name': 'Event Marketing, PR & Sponsorship',
      'duration': '4 Months',
      'description':
          'Covers event promotion strategies, PR, digital marketing, media relations and sponsorship sales.',
      'governmentJobs': [
        'Public Relations Assistant (Government Events)',
        'Tourism Promotion Executive'
      ],
      'privateJobs': [
        'Event Marketing Executive',
        'Sponsorship Sales Manager',
        'PR Executive (Events)'
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EventManagementCollegesPage()),
              );
            },
            child: Text(
              'Colleges',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          final governmentJobs = List<String>.from(course['governmentJobs'] ?? []);
          final privateJobs = List<String>.from(course['privateJobs'] ?? []);

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                Text('Government Jobs:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                governmentJobs.isEmpty
                    ? Text('No common government roles listed.')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: governmentJobs.map((job) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('• '),
                              Expanded(child: Text(job)),
                            ]),
                          );
                        }).toList(),
                      ),
                SizedBox(height: 12),
                Text('Private Jobs:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                privateJobs.isEmpty
                    ? Text('No common private roles listed.')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: privateJobs.map((job) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('• '),
                              Expanded(child: Text(job)),
                            ]),
                          );
                        }).toList(),
                      ),
              ]),
            ),
          );
        },
      ),
    );
  }
}

class EventManagementCollegesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colleges = [
      {
        'name': 'Institute of Event Studies, Chennai',
        'district': 'Chennai',
        'courses': ['Diploma in Event Management', 'Certificate in Wedding Planning']
      },
      {
        'name': 'Madurai School of Events',
        'district': 'Madurai',
        'courses': ['PG Diploma in Event Management', 'Festival Management']
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Event Management Colleges'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: colleges.length,
        itemBuilder: (context, index) {
          final c = colleges[index];
          return Card(
            child: ListTile(
              title: Text(c['name'] as String), // ✅ Fixed casting issue
              subtitle: Text('${c['district']} • ${(c['courses'] as List).join(', ')}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CollegeDetailsPage(college: c)),
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
      appBar: AppBar(title: Text(college['name'] as String), backgroundColor: Colors.red), // ✅ Fixed casting
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(college['name'] as String, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // ✅
          SizedBox(height: 8),
          Text('District: ${college['district']}'),
          SizedBox(height: 12),
          Text('Courses:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          ...courses.map((c) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text('• $c'),
              )),
        ]),
      ),
    );
  }
}
