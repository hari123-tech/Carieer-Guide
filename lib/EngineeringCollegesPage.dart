import 'package:flutter/material.dart';

class EngineeringCollegesPage extends StatefulWidget {
  @override
  _EngineeringCollegesPageState createState() => _EngineeringCollegesPageState();
}

class _EngineeringCollegesPageState extends State<EngineeringCollegesPage> {
  String searchQuery = '';

  final Map<String, List<String>> colleges = {
    // Chennai
    'Anna University, Chennai': ['CSE', 'ECE', 'EEE', 'Mechanical', 'Civil', 'IT', 'Chemical'],
    'SRM Institute of Science and Technology, Chennai': ['CSE', 'ECE', 'Mechanical', 'Aerospace', 'Biotech'],
    'Sathyabama University, Chennai': ['CSE', 'ECE', 'Mechanical', 'Civil', 'IT', 'Biotech'],
    'Hindustan Institute of Technology, Chennai': ['CSE', 'ECE', 'Aerospace', 'Automobile', 'Mechanical'],
    'Velammal Engineering College, Chennai': ['CSE', 'ECE', 'EEE', 'Mechanical', 'IT'],
    'Loyola ICAM College, Chennai': ['CSE', 'ECE', 'Mechanical', 'Civil'],
    'Jeppiaar Engineering College, Chennai': ['CSE', 'ECE', 'Mechanical', 'IT', 'EEE'],
    'Saveetha Engineering College, Chennai': ['CSE', 'ECE', 'Mechanical', 'Civil', 'IT'],
    'Rajalakshmi Engineering College, Chennai': ['CSE', 'ECE', 'IT', 'Mechanical', 'Biotech'],
    'Panimalar Engineering College, Chennai': ['CSE', 'ECE', 'EEE', 'Mechanical', 'Civil'],

    // Coimbatore
    'PSG College of Technology, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'EEE', 'Textile'],
    'Coimbatore Institute of Technology, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'EEE', 'Chemical'],
    'Kumaraguru College of Technology, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'IT', 'Mechatronics'],
    'Karunya Institute of Technology, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'Civil'],
    'SNS College of Technology, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'IT'],
    'Sri Krishna College of Engineering, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'EEE'],
    'Amrita Vishwa Vidyapeetham, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'EEE', 'Aerospace'],
    'Dr. Mahalingam College of Engineering, Pollachi': ['CSE', 'ECE', 'Mechanical', 'EEE', 'IT'],
    'Hindusthan College of Engineering, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'IT'],
    'RVS College of Engineering, Coimbatore': ['CSE', 'ECE', 'Mechanical', 'EEE'],

    // Madurai
    'Thiagarajar College of Engineering, Madurai': ['CSE', 'ECE', 'Mechanical', 'EEE', 'Civil'],
    'Velammal College of Engineering, Madurai': ['CSE', 'ECE', 'Mechanical', 'IT'],
    'SACS MAVMM Engineering College, Madurai': ['CSE', 'ECE', 'Mechanical', 'Civil'],
    'Latha Mathavan Engineering College, Madurai': ['CSE', 'ECE', 'Mechanical'],
    'Raja College of Engineering, Madurai': ['CSE', 'ECE', 'Mechanical', 'EEE'],
    'Anna University Regional Campus, Madurai': ['CSE', 'ECE', 'Mechanical', 'Civil'],
    'Ultra College of Engineering, Madurai': ['CSE', 'ECE', 'Mechanical'],
    'Mangayarkarasi College of Engineering, Madurai': ['CSE', 'ECE', 'Mechanical'],
    'P.T.R College of Engineering, Madurai': ['CSE', 'ECE', 'Mechanical'],
    'K.L.N College of Engineering, Madurai': ['CSE', 'ECE', 'Mechanical', 'EEE'],

    // Tiruchirappalli
    'National Institute of Technology (NIT), Trichy': ['CSE', 'ECE', 'Mechanical', 'Civil', 'EEE', 'Production'],
    'Bharathidasan University, Trichy': ['CSE', 'ECE', 'Biotech', 'IT'],
    'MAM College of Engineering, Trichy': ['CSE', 'ECE', 'Mechanical'],
    'JJ College of Engineering, Trichy': ['CSE', 'ECE', 'Mechanical'],
    'Anna University Regional Campus, Trichy': ['CSE', 'ECE', 'Mechanical'],
    'CARE College of Engineering, Trichy': ['CSE', 'ECE', 'Mechanical'],
    'Saranathan College of Engineering, Trichy': ['CSE', 'ECE', 'Mechanical', 'IT'],
    'Shivani College of Engineering, Trichy': ['CSE', 'ECE', 'Mechanical'],
    'SRM Trichy Campus': ['CSE', 'ECE', 'Mechanical'],
    'Oxford Engineering College, Trichy': ['CSE', 'ECE', 'Mechanical'],

    // Nagercoil (Kanyakumari)
    'Arunachala College of Engineering for Women, Nagercoil': ['CSE', 'ECE', 'EEE','AI&DS','IT'],
    'St. Xavier\'s Catholic College of Engineering, Nagercoil': ['CSE', 'ECE', 'Mechanical', 'EEE'],
    'Bethlahem Institute of Engineering, Nagercoil': ['CSE', 'ECE', 'Mechanical'],
    'Narayanaguru College of Engineering, Nagercoil': ['CSE', 'ECE', 'Mechanical'],
    'C.S.I Institute of Technology, Nagercoil': ['CSE', 'ECE', 'Mechanical', 'Civil'],
    'Udaya School of Engineering, Nagercoil': ['CSE', 'ECE', 'Mechanical'],
    'Maria College of Engineering, Nagercoil': ['CSE', 'ECE', 'Mechanical'],
    'Ponjesly College of Engineering, Nagercoil': ['CSE', 'ECE', 'Mechanical', 'Civil'],
    'Sardar Raja College of Engineering, Nagercoil': ['CSE', 'ECE', 'Mechanical'],
    'Lord Jegannath College of Engineering, Nagercoil': ['CSE', 'ECE', 'Mechanical'],
  };

  @override
  Widget build(BuildContext context) {
    final filteredColleges = colleges.entries.where((entry) {
      return entry.key.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Engineering Colleges in Tamil Nadu'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search colleges...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredColleges.isEmpty
                ? Center(child: Text('No matching colleges found.'))
                : ListView.builder(
                    itemCount: filteredColleges.length,
                    itemBuilder: (context, index) {
                      final collegeName = filteredColleges[index].key;
                      final departments = filteredColleges[index].value.join(', ');
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 4,
                        child: ListTile(
                          leading: Icon(Icons.location_city, color: Colors.deepPurple),
                          title: Text(collegeName),
                          subtitle: Text('Departments: $departments'),
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
