import 'package:flutter/material.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CollegesPage()),
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
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
                      final governmentJobs =
                          List<String>.from(course['governmentJobs'] ?? []);
                      final privateJobs =
                          List<String>.from(course['privateJobs'] ?? []);

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
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text('Duration: ${course['duration']}'),
                              SizedBox(height: 6),
                              Text('Description: ${course['description']}'),
                              SizedBox(height: 10),
                              Text(
                                'Government Jobs:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),
                              governmentJobs.isEmpty
                                  ? Text('No common government roles listed.')
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: governmentJobs
                                          .map((job) => Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 4),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('• '),
                                                    Expanded(child: Text(job)),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                              SizedBox(height: 10),
                              Text(
                                'Private Jobs:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),
                              privateJobs.isEmpty
                                  ? Text('No common private roles listed.')
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: privateJobs
                                          .map((job) => Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 4),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('• '),
                                                    Expanded(child: Text(job)),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
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

/// CollegesPage shows districts of Tamil Nadu and 10 colleges per district
class CollegesPage extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> tamilNaduColleges = {
    // District: List of colleges (each college has name + courses)
    'Chennai': [
      {
        'name': 'Chennai Institute of Hotel Management',
        'courses': [
          'Diploma in Hotel Management',
          'BHM (Bachelor of Hotel Management)',
          'Certificate in F&B Service'
        ]
      },
      {
        'name': 'Madras School of Hospitality',
        'courses': ['BHM', 'Advanced Diploma in Hospitality Management']
      },
      {
        'name': 'North Chennai Hotel Training Centre',
        'courses': ['Diploma in Hotel Management', 'Certificate in F&B']
      },
      {
        'name': 'Sri Venkateshwara Institute of Hospitality',
        'courses': ['BHM', 'PG Diploma in Hotel Management']
      },
      {
        'name': 'Starlight Hotel Management College',
        'courses': ['Diploma', 'Certificate in Housekeeping', 'BHM']
      },
      {
        'name': 'Horizon Academy of Hospitality',
        'courses': ['Advanced Diploma', 'Certificate in F&B']
      },
      {
        'name': 'City College of Tourism & Hospitality',
        'courses': ['BHM', 'Diploma in Hotel Management']
      },
      {
        'name': 'Seaside Hospitality Institute',
        'courses': ['Diploma', 'Certificate in F&B', 'PG Diploma']
      },
      {
        'name': 'Sri Krishna Hotel Management College',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Chennai Culinary & Hospitality School',
        'courses': ['Certificate in F&B', 'Advanced Diploma']
      },
    ],
    'Coimbatore': [
      {
        'name': 'Coimbatore Institute of Hotel Management',
        'courses': ['BHM', 'Diploma', 'Certificate in F&B']
      },
      {
        'name': 'Avinashilingam School of Hospitality',
        'courses': ['Diploma', 'Advanced Diploma']
      },
      {
        'name': 'PSG Hospitality College',
        'courses': ['BHM', 'PG Diploma']
      },
      {
        'name': 'Sri Ramakrishna Hotel Management Institute',
        'courses': ['Diploma', 'Certificate in F&B']
      },
      {
        'name': 'Coimbatore Culinary Institute',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Lakshmi College of Hospitality',
        'courses': ['BHM', 'Advanced Diploma']
      },
      {
        'name': 'Central Hotel Management College, Coimbatore',
        'courses': ['Diploma', 'PG Diploma']
      },
      {
        'name': 'Grace Hospitality Academy',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'WestFlow Institute of Tourism & Hospitality',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Coimbatore School of Hotel & Catering',
        'courses': ['Certificate', 'Diploma', 'Advanced Diploma']
      },
    ],
    'Madurai': [
      {
        'name': 'Madurai Hotel Management College',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Meenakshi Hospitality Institute',
        'courses': ['Diploma', 'Certificate in F&B']
      },
      {
        'name': 'Madurai Culinary & Tourism Academy',
        'courses': ['Certificate', 'Advanced Diploma']
      },
      {
        'name': 'Thiyagarajar School of Hospitality',
        'courses': ['BHM', 'PG Diploma']
      },
      {
        'name': 'Sankar Institute of Hotel Management',
        'courses': ['Diploma', 'Certificate in F&B']
      },
      {
        'name': 'Vivekananda College of Hospitality',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Anna Hospitality Academy, Madurai',
        'courses': ['Certificate in Housekeeping', 'Diploma']
      },
      {
        'name': 'Southern Hospitality Institute',
        'courses': ['Advanced Diploma', 'Diploma']
      },
      {
        'name': 'Pasumpon Hotel Management College',
        'courses': ['BHM', 'Certificate in F&B']
      },
      {
        'name': 'Lotus School of Culinary Arts',
        'courses': ['Certificate', 'Diploma']
      },
    ],
    'Tiruchirappalli': [
      {
        'name': 'Trichy Institute of Hotel Management',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Kongu Hospitality College (Trichy Campus)',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Bharathidasan School of Hospitality',
        'courses': ['BHM', 'PG Diploma']
      },
      {
        'name': 'Rockfort Hotel Training Centre',
        'courses': ['Diploma', 'Certificate in F&B']
      },
      {
        'name': 'Central Trichy Hospitality Institute',
        'courses': ['Advanced Diploma', 'Diploma']
      },
      {
        'name': 'Sree Renga Hospitality Academy',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'St. Joseph Hotel Management College',
        'courses': ['BHM', 'Certificate']
      },
      {
        'name': 'Kavery Institute of Culinary Arts',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Riverfront Hospitality School',
        'courses': ['Diploma', 'Advanced Diploma']
      },
      {
        'name': 'Trichy Culinary Institute',
        'courses': ['Certificate', 'BHM']
      },
    ],
    'Salem': [
      {
        'name': 'Salem Institute of Hotel Management',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Bannari Hospitality College',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Salem Culinary Academy',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Thanthai Periyar School of Hospitality',
        'courses': ['Advanced Diploma', 'BHM']
      },
      {
        'name': 'Velocity Hospitality Institute',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Sri Lakshmi Hospitality College',
        'courses': ['BHM', 'PG Diploma']
      },
      {
        'name': 'Salem Hotel & Catering Training Centre',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'Greenfields School of Hospitality',
        'courses': ['Diploma', 'Certificate in Housekeeping']
      },
      {
        'name': 'Vethathiri Institute of Hospitality',
        'courses': ['Diploma', 'Advanced Diploma']
      },
      {
        'name': 'Pavilion Culinary Institute',
        'courses': ['Certificate', 'Diploma']
      },
    ],
    'Erode': [
      {
        'name': 'Erode School of Hotel Management',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Bannari Amman Hospitality Institute',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Erode Culinary Academy',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Kandasamy Hotel Management College',
        'courses': ['Diploma', 'Advanced Diploma']
      },
      {
        'name': 'Erode City Hospitality School',
        'courses': ['Certificate', 'BHM']
      },
      {
        'name': 'Riverside Institute of Hospitality',
        'courses': ['Diploma', 'PG Diploma']
      },
      {
        'name': 'Nimra Hospitality Academy',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'Sundaram School of Culinary Arts',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Erode Vocational Centre for Hospitality',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Heritage Hotel Management Institute',
        'courses': ['BHM', 'Diploma']
      },
    ],
    'Tirunelveli': [
      {
        'name': 'Tirunelveli Institute of Hotel Management',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Nadar Hospitality College',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Tenkasi Culinary & Hospitality School',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Thamirabarani School of Hospitality',
        'courses': ['BHM', 'Advanced Diploma']
      },
      {
        'name': 'Manonmaniam Hospitality Institute',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Coastal Hospitality Academy',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'Siva Institute of Hotel Management',
        'courses': ['BHM', 'PG Diploma']
      },
      {
        'name': 'Palayamkottai Culinary School',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'Kudankulam Hospitality Training Centre',
        'courses': ['Diploma', 'Certificate in F&B']
      },
      {
        'name': 'Evergreen Hotel Management College',
        'courses': ['Diploma', 'Advanced Diploma']
      },
    ],
    'Kanyakumari': [
      {
        'name': 'Kanyakumari Institute of Hospitality',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Cape Hospitality College',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'South Shore Culinary Academy',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Anna Maria Hotel Management School',
        'courses': ['Diploma', 'Advanced Diploma']
      },
      {
        'name': 'Fishermen\'s Hospitality Institute',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'Vattakottai Hospitality Centre',
        'courses': ['Diploma', 'Certificate in Housekeeping']
      },
      {
        'name': 'Nagercoil College of Hospitality',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Lakeview Hospitality Academy',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'Kanyakumari Culinary School',
        'courses': ['Certificate in F&B', 'Advanced Diploma']
      },
      {
        'name': 'Southern Coast Hotel Management',
        'courses': ['Diploma', 'BHM']
      },
    ],
    'Vellore': [
      {
        'name': 'Vellore Institute of Hospitality',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Christian Hospitaliy College, Vellore',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Vellore Culinary Academy',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Golden Valley School of Hospitality',
        'courses': ['Diploma', 'Advanced Diploma']
      },
      {
        'name': 'Vellore City Hospitality Institute',
        'courses': ['BHM', 'PG Diploma']
      },
      {
        'name': 'St. John Hospitality College',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'SciTech Hospitality School',
        'courses': ['Diploma', 'Certificate in F&B']
      },
      {
        'name': 'North Vellore Hotel Management Centre',
        'courses': ['Diploma', 'BHM']
      },
      {
        'name': 'Crescent Hospitality Academy',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'Vellore Professional School of Hospitality',
        'courses': ['PG Diploma', 'Diploma']
      },
    ],
    'Thanjavur': [
      {
        'name': 'Thanjavur Institute of Hotel Management',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Brihadeeswarar Hospitality College',
        'courses': ['BHM', 'Diploma']
      },
      {
        'name': 'Kaveri Culinary Academy',
        'courses': ['Certificate in F&B', 'Diploma']
      },
      {
        'name': 'Thanjavur School of Hospitality',
        'courses': ['Diploma', 'Advanced Diploma']
      },
      {
        'name': 'Royal Hospitality Institute, Thanjavur',
        'courses': ['BHM', 'PG Diploma']
      },
      {
        'name': 'Saraswathi Hotel Management College',
        'courses': ['Diploma', 'Certificate']
      },
      {
        'name': 'Palanisamy Culinary School',
        'courses': ['Certificate', 'Diploma']
      },
      {
        'name': 'Grand Palace Hospitality Institute',
        'courses': ['Diploma', 'BHM']
      },
      {
        'name': 'Thanjavur Vocational Centre for Hospitality',
        'courses': ['Diploma', 'Certificate in Housekeeping']
      },
      {
        'name': 'Heritage School of Hospitality',
        'courses': ['Advanced Diploma', 'Diploma']
      },
    ],
  };

  CollegesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final districts = tamilNaduColleges.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Colleges — Hotel Management (TN)'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: districts.length,
        itemBuilder: (context, index) {
          final district = districts[index];
          final colleges = tamilNaduColleges[district] ?? [];

          return Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ExpansionTile(
              title: Text(
                district,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: colleges.map((college) {
                final collegeName = college['name'] as String;
                final courses = List<String>.from(college['courses'] ?? []);
                return ListTile(
                  title: Text(collegeName),
                  subtitle: Text(courses.join(', ')),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    // Show college detail dialog/page
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text(collegeName),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Courses available:'),
                                SizedBox(height: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: courses
                                      .map((c) => Padding(
                                            padding: EdgeInsets.only(bottom: 6),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('• '),
                                                Expanded(child: Text(c)),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                                SizedBox(height: 12),
                                Text(
                                    'Note: This is sample data. Replace with verified college details when ready.')
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
