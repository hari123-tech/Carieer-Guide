import 'package:flutter/material.dart';
import 'FashionCollegesPage.dart';

class FashionDesigningPage extends StatefulWidget {
  final String category;

  FashionDesigningPage({required this.category});

  @override
  State<FashionDesigningPage> createState() => _FashionDesigningPageState();
}

class _FashionDesigningPageState extends State<FashionDesigningPage> {
  String searchQuery = '';

  final List<Map<String, String>> defaultCourses = [
    {
      'name': 'Diploma in Fashion Design',
      'duration': '1 Year',
      'benefits': 'Learn basics of fashion, pattern making, and garment construction.',
      'govtJobs': 'Not available',
      'privateJobs': 'Fashion Assistant, Textile Designer, Garment Technician',
    },
    {
      'name': 'Advanced Diploma in Fashion Technology',
      'duration': '2 Years',
      'benefits': 'Master textile design, fashion marketing, and CAD tools.',
      'govtJobs': 'Not available',
      'privateJobs': 'Fashion Technologist, CAD Designer, Apparel Merchandiser',
    },
    {
      'name': 'Certificate in Fashion Styling',
      'duration': '6 Months',
      'benefits': 'Focus on styling, accessories, and fashion photography.',
      'govtJobs': 'Not available',
      'privateJobs': 'Fashion Stylist, Image Consultant, Visual Merchandiser',
    },
    {
      'name': 'Bachelor of Fashion Design',
      'duration': '3 Years',
      'benefits': 'Comprehensive learning including designing, merchandising, and portfolios.',
      'govtJobs': 'Handloom and Textile Department Designer, Govt Skill Training Centers',
      'privateJobs': 'Fashion Designer, Brand Manager, Fashion Illustrator',
    },
    {
      'name': 'Fashion Merchandising and Retail',
      'duration': '1 Year',
      'benefits': 'Understand fashion markets, branding, and retail trends.',
      'govtJobs': 'Not available',
      'privateJobs': 'Retail Buyer, Fashion Retail Manager, Merchandising Executive',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCourses = defaultCourses.where((course) {
      final name = course['name']!.toLowerCase();
      return name.contains(searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Colors.red,
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FashionCollegesPage(),
                ),
              );
            },
            icon: Icon(Icons.school, color: Colors.white),
            label: Text(
              'Colleges',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
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
                ? const Center(child: Text('No matching courses found.'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = filteredCourses[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            course['name']!,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Duration: ${course['duration']}'),
                                SizedBox(height: 4),
                                Text('Benefits: ${course['benefits']}'),
                                SizedBox(height: 8),
                                Text('Government Jobs: ${course['govtJobs']}'),
                                SizedBox(height: 4),
                                Text('Private Jobs: ${course['privateJobs']}'),
                              ],
                            ),
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


