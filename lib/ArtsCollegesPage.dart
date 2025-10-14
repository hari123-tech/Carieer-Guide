import 'package:flutter/material.dart';

class CollegesInTamilNaduPage extends StatelessWidget {
  final List<String> districts = [
    'Chennai', 'Coimbatore', 'Madurai', 'Trichy',
    'Erode', 'Kanyakumari', 'Tirunelveli'
  ];

  final List<String> courses = [
    'B.A.', 'BFA', 'B.Des', 'BMM', 'BJMC',
    'BA History', 'BA Psychology', 'BA Sociology',
    'BA Political Science', 'BA Philosophy',
    'BA Literature', 'BA Liberal Arts',
    'BA Performing Arts', 'BA Foreign Languages',
    'BA Education'
  ];

  final Map<String, Map<String, List<String>>> rawCollegeNames = {
    for (var course in [
      'B.A.', 'BFA', 'B.Des', 'BMM', 'BJMC',
      'BA History', 'BA Psychology', 'BA Sociology',
      'BA Political Science', 'BA Philosophy',
      'BA Literature', 'BA Liberal Arts',
      'BA Performing Arts', 'BA Foreign Languages',
      'BA Education'
    ])
      course: {
        for (var district in [
          'Chennai', 'Coimbatore', 'Madurai', 'Trichy',
          'Erode', 'Kanyakumari', 'Tirunelveli'
        ])
          district: List.generate(10, (i) => 'Sample College ${i + 1} for $course in $district')
      },
  };

  List<Widget> buildCourseTiles() {
    return courses.map((course) {
      final districtMap = rawCollegeNames[course] ?? {};
      return ExpansionTile(
        title: Text(course,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        children: districts.map((district) {
          final names = districtMap[district] ??
              List.filled(10, 'College name for $course in $district');
          return ExpansionTile(
            title: Text(district,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: Colors.teal)),
            children: names.map((collegeName) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Text(
                  '• $collegeName\n  Domain: $course',
                  style: TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
          );
        }).toList(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colleges in Tamil Nadu'),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView(children: buildCourseTiles()),
    );
  }
}

