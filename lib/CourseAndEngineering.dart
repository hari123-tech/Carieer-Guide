import 'package:flutter/material.dart';
import 'EngineeringCollegesPage.dart';

class CourseAndEngineering extends StatefulWidget {
  CourseAndEngineering({Key? key}) : super(key: key);

  @override
  _CourseAndEngineeringState createState() => _CourseAndEngineeringState();
}

class _CourseAndEngineeringState extends State<CourseAndEngineering> {
  String searchQuery = '';

  final List<Map<String, dynamic>> engineeringCourses = [
    {
      'name': 'Mechanical Engineering',
      'duration': '4 Years',
      'benefits': 'Covers mechanics, kinematics, and energy principles.',
      'governmentJobs': [
        'Mechanical Engineer (PSUs like BHEL, NTPC, DRDO)',
        'Maintenance Engineer in government industries',
        'Technical Officer in government research labs',
        'Junior Engineer in public works departments'
      ],
      'privateJobs': [
        'Design Engineer in manufacturing firms',
        'Production Engineer in automobile companies',
        'R&D Engineer in private research houses',
        'Project Manager in private construction firms'
      ],
    },
    {
      'name': 'Computer Science Engineering',
      'duration': '4 Years',
      'benefits': 'Focuses on software development, AI, and data science.',
      'governmentJobs': [
        'Software Engineer in government IT wings',
        'System Analyst for government projects',
        'Technical Officer / Scientist (DRDO, ISRO, NIC)'
      ],
      'privateJobs': [
        'Software Developer',
        'Data Scientist / ML Engineer',
        'DevOps Engineer',
        'Cloud Solutions Architect'
      ],
    },
    {
      'name': 'Electrical Engineering',
      'duration': '4 Years',
      'benefits': 'Involves power systems, electronics, and circuits.',
      'governmentJobs': [
        'Power Systems Engineer in State Electricity Boards',
        'Technical Officer in public utilities and railways',
        'Electronics Engineer in defense/public sector units'
      ],
      'privateJobs': [
        'Electronics Design Engineer',
        'Control Systems Engineer',
        'Field Service Engineer for private firms'
      ],
    },
    {
      'name': 'Civil Engineering',
      'duration': '4 Years',
      'benefits': 'Design and construction of infrastructure.',
      'governmentJobs': [
        'Assistant Executive Engineer in Public Works Department (PWD)',
        'Junior Engineer in municipal corporations',
        'Structural Engineer in government housing projects'
      ],
      'privateJobs': [
        'Site Engineer / Project Engineer in construction companies',
        'Quality Control Engineer',
        'Structural Consultant for private firms'
      ],
    },
    {
      'name': 'Aerospace Engineering',
      'duration': '4 Years',
      'benefits': 'Design of aircraft and spacecraft.',
      'governmentJobs': [
        'Aeronautical Engineer at ISRO/DRDO',
        'Technical Officer in defense aerospace wings'
      ],
      'privateJobs': [
        'Aerospace Design Engineer in private OEMs',
        'Flight Test Engineer',
        'Propulsion Engineer in private firms'
      ],
    },
    {
      'name': 'Biomedical Engineering',
      'duration': '4 Years',
      'benefits': 'Applies engineering to healthcare and medical devices.',
      'governmentJobs': [
        'Biomedical Engineer in government hospitals and institutes',
        'Technical Officer in public health research units'
      ],
      'privateJobs': [
        'Medical Device Design Engineer',
        'Clinical Engineer in private hospitals',
        'R&D Scientist in biotech/pharma firms'
      ],
    },
    {
      'name': 'Chemical Engineering',
      'duration': '4 Years',
      'benefits': 'Involves process engineering and chemical manufacturing.',
      'governmentJobs': [
        'Process Engineer in public sector chemical plants',
        'Technical Officer in government research labs'
      ],
      'privateJobs': [
        'Plant Engineer in chemical industries',
        'Production Engineer',
        'Safety & Environmental Engineer in private industry'
      ],
    },
    {
      'name': 'Electronics and Communication',
      'duration': '4 Years',
      'benefits': 'Deals with signal processing and communication tech.',
      'governmentJobs': [
        'Telecom Engineer in government telecom units',
        'Electronics Engineer in defense/public labs'
      ],
      'privateJobs': [
        'Embedded Systems Engineer',
        'VLSI Designer',
        'RF/Communication Engineer'
      ],
    },
    {
      'name': 'Information Technology',
      'duration': '4 Years',
      'benefits': 'Focuses on networking, databases, and software systems.',
      'governmentJobs': [
        'Network Administrator for government IT infrastructure',
        'System Analyst for government digital initiatives'
      ],
      'privateJobs': [
        'Backend/Full-stack Developer',
        'Database Administrator',
        'Cloud/DevOps Engineer'
      ],
    },
    {
      'name': 'Mechatronics Engineering',
      'duration': '4 Years',
      'benefits':
          'Integration of mechanical, electrical, and computer systems.',
      'governmentJobs': [
        'Automation Engineer in government manufacturing units',
        'Technical Officer in public research centres'
      ],
      'privateJobs': [
        'Robotics Engineer in private automation firms',
        'Controls Engineer',
        'Maintenance/Service Engineer for automated systems'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCourses = engineeringCourses.where((course) {
      final name = (course['name'] as String).toLowerCase();
      return name.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Engineering Courses'),
        backgroundColor: Colors.blue,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.school, color: Colors.white),
            label: Text(
              'Colleges',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EngineeringCollegesPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredCourses.isEmpty
                ? Center(child: Text('No matching courses found.'))
                : ListView.builder(
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = filteredCourses[index];
                      final List<dynamic> governmentJobs =
                          (course['governmentJobs'] as List<dynamic>?) ?? [];
                      final List<dynamic> privateJobs =
                          (course['privateJobs'] as List<dynamic>?) ?? [];

                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 6),
                              Text('Duration: ${course['duration']}'),
                              SizedBox(height: 6),
                              Text('Benefits: ${course['benefits']}'),
                              SizedBox(height: 8),
                              Text(
                                'Government Job Opportunities:',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 6),
                              if (governmentJobs.isEmpty)
                                Text('No government job data available')
                              else
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: governmentJobs.map<Widget>((job) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('• ',
                                              style: TextStyle(fontSize: 14)),
                                          Expanded(
                                            child: Text(
                                              job.toString(),
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              SizedBox(height: 8),
                              Text(
                                'Private Job Opportunities:',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 6),
                              if (privateJobs.isEmpty)
                                Text('No private job data available')
                              else
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: privateJobs.map<Widget>((job) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('• ',
                                              style: TextStyle(fontSize: 14)),
                                          Expanded(
                                            child: Text(
                                              job.toString(),
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              SizedBox(height: 6),
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
