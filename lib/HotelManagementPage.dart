import 'package:flutter/material.dart';
// Import the CollegesPage file — update the path if you put the file in a different folder.
import 'HotelManagementCollege.dart';

class HotelManagementPage extends StatefulWidget {
  final String category;

  HotelManagementPage({required this.category});

  @override
  State<HotelManagementPage> createState() => _HotelManagementPageState();
}

class _HotelManagementPageState extends State<HotelManagementPage> {
  String searchQuery = '';

  final List<Map<String, dynamic>> hotelCourses = [
    {
      'name': 'Diploma in Hotel Management',
      'duration': '1 Year',
      'description':
          'Basic knowledge of hotel operations, front office, and housekeeping.',
      'governmentJobs': [
        'Hotel Inspector (Tourism Dept.)',
        'Food Safety Inspector (Local Health Dept.)',
        'Tourism Promotion Officer (State Tourism)'
      ],
      'privateJobs': [
        'Front Office Executive',
        'Housekeeping Supervisor',
        'Food & Beverage Attendant',
        'Banquet Coordinator'
      ]
    },
    {
      'name': 'Bachelor of Hotel Management (BHM)',
      'duration': '3 Years',
      'description':
          'In-depth course covering hospitality, food service, and hotel administration.',
      'governmentJobs': [
        'Hospitality Officer (Government Guest Houses)',
        'Hotel Management Trainer (Vocational Centers)',
        'Tourism Officer (State/City)'
      ],
      'privateJobs': [
        'Assistant Manager (Rooms/F&B)',
        'Restaurant Manager',
        'Chef de Partie',
        'Sales & Marketing Executive (Hotel Sales)'
      ]
    },
    {
      'name': 'Certificate in Food & Beverage Service',
      'duration': '6 Months',
      'description':
          'Learn table service, etiquette, and food handling techniques.',
      'governmentJobs': [
        'Food Inspector (Local Health Agencies)',
      ],
      'privateJobs': [
        'Waiter/Waitress',
        'Bar Service Staff',
        'Room Service Attendant',
        'Catering Assistant'
      ]
    },
    {
      'name': 'Advanced Diploma in Hospitality Management',
      'duration': '2 Years',
      'description':
          'Covers management, event planning, and international hospitality practices.',
      'governmentJobs': [
        'Event Coordinator (Government Events)',
        'Tourism Development Officer',
        'Training Officer (Hospitality Institutes)'
      ],
      'privateJobs': [
        'Event Manager',
        'Operations Manager',
        'Corporate Hospitality Manager',
        'Revenue / Yield Manager'
      ]
    },
    {
      'name': 'Post Graduate Diploma in Hotel Management',
      'duration': '1 Year',
      'description':
          'Suitable for graduates, covering advanced topics in hotel and tourism.',
      'governmentJobs': [
        'Senior Tourism Officer',
        'Hotel Administration Roles in Govt-run Properties',
        'Policy Analyst (Tourism Dept.)'
      ],
      'privateJobs': [
        'General Manager (Small Hotels)',
        'Corporate Trainer (Hospitality)',
        'Food & Beverage Director',
        'Consultant (Hotel Operations)'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCourses = hotelCourses.where((course) {
      final name = (course['name'] as String).toLowerCase();
      return name.contains(searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Colors.red,
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to the CollegesPage (ensure colleges_page.dart defines CollegesPage)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollegesPage()),
              );
            },
            child: Text(
              "Colleges",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: filteredCourses.isEmpty
                ? Center(child: Text('No matching courses found.'))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = filteredCourses[index];
                      final governmentJobs = List<String>.from(course['governmentJobs'] ?? []);
                      final privateJobs = List<String>.from(course['privateJobs'] ?? []);

                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course['name'],
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text('Duration: ${course['duration']}'),
                              SizedBox(height: 6),
                              Text('Description: ${course['description']}'),
                              SizedBox(height: 10),
                              Text('Government Jobs:', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              governmentJobs.isEmpty
                                  ? Text('No common government roles listed.')
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: governmentJobs.map((job) => Padding(
                                        padding: EdgeInsets.only(bottom: 4),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('• '),
                                            Expanded(child: Text(job)),
                                          ],
                                        ),
                                      )).toList(),
                                    ),
                              SizedBox(height: 10),
                              Text('Private Jobs:', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              privateJobs.isEmpty
                                  ? Text('No common private roles listed.')
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: privateJobs.map((job) => Padding(
                                        padding: EdgeInsets.only(bottom: 4),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('• '),
                                            Expanded(child: Text(job)),
                                          ],
                                        ),
                                      )).toList(),
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



