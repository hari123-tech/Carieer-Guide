import 'package:flutter/material.dart';

class FashionCollegesPage extends StatelessWidget {
  final List<Map<String, String>> colleges = [
    {
      'name': 'NIFT Chennai',
      'domain': 'Fashion Design, Textile Design, Fashion Communication, Knitwear Design',
    },
    {
      'name': 'Pearl Academy, Chennai',
      'domain': 'Fashion Styling, Fashion Business, Fashion Communication',
    },
    {
      'name': 'IIFT (Indian Institute of Fashion Technology), Chennai',
      'domain': 'Fashion Design, Apparel Merchandising, Interior Design',
    },
    {
      'name': 'DOT School of Design, Chennai',
      'domain': 'Fashion Design, Product Design, Communication Design',
    },
    {
      'name': 'Madras Institute of Fashion Technology (MFT), Chennai',
      'domain': 'Fashion Design, Apparel Manufacturing, Visual Merchandising',
    },
    {
      'name': 'Hindustan Institute of Technology and Science, Chennai',
      'domain': 'Fashion Design, Apparel Design, B.Des in Fashion',
    },
    {
      'name': 'Avinashilingam Institute for Home Science & Higher Education, Coimbatore',
      'domain': 'Textile & Apparel Design, Fashion Design',
    },
    {
      'name': 'PSG College of Technology, Coimbatore',
      'domain': 'Apparel & Fashion Technology (B.Tech)',
    },
    {
      'name': 'Kumaraguru College of Technology, Coimbatore',
      'domain': 'Fashion Technology, Apparel Manufacturing, Textile Processing',
    },
    {
      'name': 'NIFT-TEA College of Knitwear Fashion, Tirupur',
      'domain': 'Knitwear Design, Fashion Apparel Design, Merchandising',
    },
    {
      'name': 'Rathinam College of Arts and Science, Coimbatore',
      'domain': 'Fashion Designing, Costume Design and Fashion',
    },
    {
      'name': 'Fatima College, Madurai',
      'domain': 'Costume Design and Fashion, Textile Design',
    },
    {
      'name': 'Sri Krishna Arts and Science College, Coimbatore',
      'domain': 'Fashion Design and Apparel Management',
    },
    {
      'name': 'Government Polytechnic College for Women, Coimbatore',
      'domain': 'Textile Technology',
    },
    {
      'name': 'Kaamadhenu Arts and Science College, Erode',
      'domain': 'Costume Design and Fashion',
    },
    {
      'name': 'Salem Sowdeswari College, Salem',
      'domain': 'Fashion Technology and Design',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion Design Colleges - Tamil Nadu'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: colleges.length,
        itemBuilder: (context, index) {
          final college = colleges[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.school, color: Colors.red),
              title: Text(
                college['name']!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  'Domains: ${college['domain']}',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
