import 'package:flutter/material.dart';

class TravelTourismPage extends StatelessWidget {
  final String category;

  TravelTourismPage({required this.category});

  final Map<String, List<Map<String, String>>> districtColleges = {
    'Chennai': [
      {
        'college': 'Madras Christian College',
        'course': 'B.A. Travel & Tourism Management',
        'duration': '3 years',
        'benefit': 'Strong industry tie-ups with travel agencies',
        'jobs': 'Travel Consultant, Tour Planner, Airline Executive',
      },
      {
        'college': 'Ethiraj College for Women',
        'course': 'Diploma in Tourism & Hospitality',
        'duration': '1 year',
        'benefit': 'Hands-on training with hospitality partners',
        'jobs': 'Hotel Manager, Tour Guide, Travel Agent',
      },
    ],
    'Coimbatore': [
      {
        'college': 'PSG College of Arts and Science',
        'course': 'BBA Tourism & Hospitality Management',
        'duration': '3 years',
        'benefit': 'Internships at top tourism companies',
        'jobs': 'Travel Executive, Operations Manager',
      },
      {
        'college': 'Dr. NGP Arts and Science College',
        'course': 'Certificate in Tourism Management',
        'duration': '6 months',
        'benefit': 'Short-term, skill-focused program',
        'jobs': 'Tour Guide, Travel Agent',
      },
    ],
    'Madurai': [
      {
        'college': 'The American College',
        'course': 'B.Com in Tourism & Travel Management',
        'duration': '3 years',
        'benefit': 'Practical experience through field visits',
        'jobs': 'Tour Coordinator, Travel Desk Executive',
      },
    ],
    'Trichy': [
      {
        'college': 'St. Joseph’s College',
        'course': 'Diploma in Travel and Tourism',
        'duration': '1 year',
        'benefit': 'Skill development with guest lectures',
        'jobs': 'Travel Consultant, Tour Manager',
      },
    ],
    'Salem': [
      {
        'college': 'Government Arts College',
        'course': 'Certificate in Travel and Tourism',
        'duration': '6 months',
        'benefit': 'Affordable program with good placement',
        'jobs': 'Tour Guide, Travel Assistant',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Colleges in Tamil Nadu'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: districtColleges.entries.map((entry) {
          final district = entry.key;
          final colleges = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                district,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              SizedBox(height: 8),
              ...colleges.map((college) => Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(
                        college['college']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text('Course: ${college['course']}'),
                          Text('Duration: ${college['duration']}'),
                          Text('Benefit: ${college['benefit']}'),
                          Text('Job Opportunities: ${college['jobs']}'),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }
}
